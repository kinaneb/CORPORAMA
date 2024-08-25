# CORPORAMA

technical test

## Erlang version

1. Install Erlang if not installed:

    ```bash
    apt-get install erlang
    ````

2. Go to the erlangApp directory:

    ```bash
    cd app/erlangApp/
    ````

3. Compile the Erlang modules:

    ```bash
    erlc validator.erl app.erl
    ```

4. Run the app:

    > the <file_name> should be in the same directory

    ```bash
    erl -noshell -s app readlines <file_name> -s init stop
    ```

## Run the Docker Development Environment

1. Build the development environment

    ```bash
    docker compose build
    ```

2. Run the commands in the container:

    ```bash
    docker compose run analyzer <the-command-from-the-entrypoint>
    ```

- docker compose run analyzer test: to run the unit tests
- docker compose run analyzer bash: to access to the interactive terminal
- docker compose run analyzer sirens_fxt.txt: to run the app on with the sirens_fxt.txt file as input

2. Remove the container:

    ```bash
    docker compose down --remove-orphans
    ```

## For Debian 12 based system you use the app executable in the dist directory

    ```bash
    cd app/dist/
    ./app <file-path>
    ```

## On Local machine the app.py and test_app.py can be run directly
>
> python3 must be installed

1. To run the app on local

    ```bash
    cd app/
    python3 app.py <file-path>
    ```

2. To run the test on local

    ```bash
    cd app/
    python3 test_app.py
    ```
