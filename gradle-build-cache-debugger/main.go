package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"strings"
)

func processLogFile(taskID string, logFile string) {
	file, err := os.Open(logFile)
	if err != nil {
		fmt.Println("Error opening file:", err)
		os.Exit(1)
	}
	defer file.Close()

	logfileFileName := filepath.Base(logFile)
	outputFile, err := os.Create("_gradlelog-" + taskID + "_" + logfileFileName)
	if err != nil {
		fmt.Println("Error creating output file:", err)
		os.Exit(1)
	}
	defer outputFile.Close()

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
			fmt.Fprint(outputFile, line)
		}

		if err == io.EOF {
			break
		}
	}
}

func main() {
	if len(os.Args) < 4 {
		fmt.Println("Usage: go run script.go <task_id> <log_file1> <log_file2>")
		os.Exit(1)
	}

	taskID := os.Args[1]
	logFile1 := os.Args[2]
	logFile2 := os.Args[3]

	processLogFile(taskID, logFile1)
	processLogFile(taskID, logFile2)
}
