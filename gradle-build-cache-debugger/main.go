package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
)

func main() {
	if len(os.Args) < 3 {
		fmt.Println("Usage: go run script.go <log_file> <task_id>")
		os.Exit(1)
	}

	logFile := os.Args[1]
	taskID := os.Args[2]

	file, err := os.Open(logFile)
	if err != nil {
		fmt.Println("Error opening file:", err)
		os.Exit(1)
	}
	defer file.Close()

	reader := bufio.NewReader(file)
	printTask := false
	for {
		line, err := reader.ReadString('\n')
		if err != nil && err != io.EOF {
			fmt.Println("Error reading file:", err)
			break
		}

		if strings.HasPrefix(line, "> Task "+taskID) {
			printTask = true
		} else if strings.HasPrefix(line, "> Task ") || len(strings.TrimSpace(line)) == 0 {
			printTask = false
		}

		if printTask {
			fmt.Print(line)
		}

		if err == io.EOF {
			break
		}
	}
}
