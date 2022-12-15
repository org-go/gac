package lib

import (
	"archive/tar"
	"bytes"
	"io"
	"net/http"

	"github.com/dsnet/compress/bzip2"
)

// SrcFile 原文件
type SrcFile struct {
	Filename string        // 文件名
	Body     *bytes.Buffer // 文件内容
}

// tarfils 归档 filename原始文件名称
func tarfils(files ...SrcFile) (io.Reader, error) {
	var buf bytes.Buffer
	tw := tar.NewWriter(&buf)
	defer tw.Close()

	for _, file := range files {
		hdr := &tar.Header{
			Name: file.Filename,
			Mode: 0777,
			Size: int64(file.Body.Len()),
		}
		if err := tw.WriteHeader(hdr); err != nil {
			return nil, err
		}
		if _, err := tw.Write(file.Body.Bytes()); err != nil {
			return nil, err
		}
	}

	return &buf, nil
}

// bz2 压缩
func bz2(reader io.Reader) (io.Reader, error) {
	var bs []byte
	buffer := bytes.NewBuffer(bs)
	wr, err := bzip2.NewWriter(buffer, &bzip2.WriterConfig{})
	defer wr.Close()
	if err != nil {
		return nil, err
	}

	io.Copy(wr, reader)
	return buffer, nil
}

// TarBzip2 Tar and Bz2
func TarBzip2(files ...SrcFile) (io.Reader, error) {
	tr, err := tarfils(files...)
	if err != nil {
		return nil, err
	}

	return bz2(tr)
}

// Downloader download
func Downloader(link string) *bytes.Buffer {
	var buf []byte
	filebuf := bytes.NewBuffer(buf)

	res, err := http.Get(link)
	if err != nil {
		panic("素材文件下载失败")
	}
	defer res.Body.Close()

	io.Copy(filebuf, res.Body)

	return filebuf
}
