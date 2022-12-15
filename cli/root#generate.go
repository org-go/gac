package cli

import (
	"errors"
	"fmt"
	"github.com/spf13/cobra"
	"os"
	"payfun.gac.service/cli/tool"
)

var generateCmd = &cobra.Command{
	Use:   "gen",
	Short: "生成表结构",
	Long:  "生成表结构",
	Args: func(cmd *cobra.Command, args []string) error {
		if len(args) == 0 {
			return errors.New(`--- - or table`)
		}
		return nil
	},
	Run: func(cmd *cobra.Command, args []string) {
		generate(args)
		fmt.Println(`--- ok`)
	},
}

/**
 * generate
 * @Description:
 * @param args
 */
func generate(args []string) {
	_path_, _ := os.Getwd()
	_ = tool.Generate().SavePath(fmt.Sprintf(`%s/%s`, _path_, `apps/v1/entity/model/`)).
		Dsn("sa:qWSxBNqb@tcp(rm-8vbjy34g96075qpoklo.mysql.zhangbei.rds.aliyuncs.com:3408)/gac?charset=utf8").
		RealNameMethod("TableName").
		Table(args[0]).
		EnableJsonTag(true).
		Config(&tool.T2tConfig{
			StructNameToHump: true,
			TagToLower:       true,
			UcFirstOnly:      true,
			SeperatFile:      true,
		}).
		TagKey("gorm").
		TagCallBack(func(columnName string, isPrimaryKey bool) string {
			var tag string
			// if isPrimaryKey {
			// 	tag = "primary_key;"
			// }
			tag += columnName
			return tag
		}).
		Run()

}

func init() {
	rootCmd.AddCommand(generateCmd)
}
