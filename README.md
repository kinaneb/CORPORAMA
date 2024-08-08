# CORPORAMA

technical test

## Run the Docker Development Environment

1. Build the development environment

```bash
docker compose build
```

2. Run the commands in the container:

```bash
docker compose run analyzer <the-command-from-the-entrypoint>
```

2. Remove the container

```bash
docker compose down --remove-orphans
```

## For Debian 12 based system you use the app executable in the dist directory:

```bash
cd app/dist/
./app <file-path>
```

## On Local machine the app.py and test_app.py can be run directly
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
