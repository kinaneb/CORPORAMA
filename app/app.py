import sys

def analyze(file_path):
    try:
        with open(file_path, 'r') as file:
            sirens = file.read().splitlines()
            sirens.sort()
            previous = ""
            next = ""
            unique = []
            other = []
            for i in range(1, len(sirens)-1):
                previous = sirens[i-1]
                current = sirens[i]
                next = sirens[i+1]
                if current != previous and current != next:
                    unique.append(current)
                else:
                    other.append(current)
        return len(unique), len(other)
    except Exception as e:
        return str(e), None
    
def main():
    if len(sys.argv) < 2:
        print('Usage: python app.py <file_path>')
        sys.exit(1)
    file_path = sys.argv[1]
    sirens = analyze(file_path)
    print(sirens)

if __name__ == '__main__':
    main()