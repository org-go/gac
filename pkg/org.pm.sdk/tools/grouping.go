package tools

// Grouping 分组
func Grouping(total, ave int) int {
	if total/ave >= 0 && total%ave > 0 {
		return total/ave + 1
	}
	return total / ave
}
