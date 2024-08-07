import sys

def analyze(file_path):
    try:
        with open(file_path, 'r') as file:
            sirens = file.read().splitlines()
        return sirens
    except Exception as e:
        return str(e)
    
def main():
    if len(sys.argv) < 2:
        print('Usage: python app.py <file_path>')
        sys.exit(1)
    file_path = sys.argv[1]
    sirens = analyze(file_path)
    print(sirens)

if __name__ == '__main__':
    main()