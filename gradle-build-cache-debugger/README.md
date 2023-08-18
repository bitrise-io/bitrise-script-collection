# Bitrise Gradle Build Cache Debugger

Currently this script can extract a given gradle task's logs from a build log.

This can be used for comparing a given gradle task's logs between two builds,
for example when debugging Gradle build cache issues.

## Running this script (example)

```shell
Usage: go run main.go <log_file> <task_id>
```

You can run this script via `go run main.go`, and you have to pass 2 parameters to it.
The first parameter is a log file path, the second parameter is a specific Gradle task ID
you want to check or compare.

Full example:

```shell
go run main.go /path/to/build.log ':app:compilePlayDebugKotlin'
```

The output of this will be the `:app:compilePlayDebugKotlin` gradle task's log output from
the `/path/to/build.log` build log file.

## How to use it

1. To debug Gradle build cache related issues add the `-Dorg.gradle.caching.debug=true` flag to the gradle command you want to debug to enable Gradle's build cache related debug information printing. If you run `gradle` in a script step, just add this flag at the end of the `gradle` command (for example `gradle assembleDebug -Dorg.gradle.caching.debug=true`). If you use a Bitrise step to run Gradle commands (e.g. `Gradle Runner` or `Android Build`) then you can add this flag (`-Dorg.gradle.caching.debug=true`) to the step as an input (the input in `Gradle Runner` is under the `Debug` category and is called `Additional options for Gradle call`) (the input in the `Android Build` step is under the `Options` category and is called `Additional Gradle Arguments`)
    - Run 2 builds after enabling this `-Dorg.gradle.caching.debug=true` gradle flag.
2. Download two build logs from bitrise.io into 2 separate files.
3. Then run this script on both files and save its output into new files.

Example:

```shell
go run main.go /path/to/build1.log ':app:compilePlayDebugKotlin' > '1-:app:compilePlayDebugKotlin'

go run main.go /path/to/build2.log ':app:compilePlayDebugKotlin' > '2-:app:compilePlayDebugKotlin'
```

This will extract the `:app:compilePlayDebugKotlin` gradle task's logs from the build log files and save it to 2 new files (`1-:app:compilePlayDebugKotlin` and `2-:app:compilePlayDebugKotlin`).

You can now compare the Gradle task outputs for example with `diff`

```shell
diff '1-:app:compilePlayDebugKotlin' '2-:app:compilePlayDebugKotlin'
```

Or with any other diffing tool you like.
