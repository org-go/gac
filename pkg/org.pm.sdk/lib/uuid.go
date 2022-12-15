package lib

import (
	"github.com/google/uuid"
	"math/rand"
	"strings"
)

// UUID
func UUID() (string, error) {
	id, err := uuid.NewUUID()
	if err != nil {
		return "", err
	}
	return strings.ReplaceAll(id.String(), "-", ""), nil
}

// GenerateGlobalID generates global unique id
func GenerateGlobalID() (globalID string) {
	s, _ := UUID()
	return s
}

/**
 * $(RandStr)
 * @Description:
 * @param l
 * @return string
 */
func RandStr(l int) string {

	const alphabet = "abcdefghijklmnopqrstuvwxyz0123456789"
	s := make([]byte, 0, l)
	for i := 0; i < l; i++ {
		s = append(s, alphabet[rand.Intn(len(alphabet))])
	}
	return string(s)
}
