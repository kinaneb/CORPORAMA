import sys

def analyze(file_path):
    try:
        with open(file_path, 'r') as file:
            sirens = file.read().splitlines()
            sirens_occurrences = {}
            for siren in sirens:
                if siren in sirens_occurrences:
                    sirens_occurrences[siren] += 1
                else:
                    sirens_occurrences[siren] = 1
            unique = sum([1 for siren, occurrences in sirens_occurrences.items() if occurrences == 1])
            other = len(sirens) - unique
        return unique, other
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