import unittest
import os
from app import analyze

class TestAnalyzer(unittest.TestCase):

    def setUp(self):
        """Create temporary test files for each test."""
        self.test_files = {
            "test1.txt": "005420120\n005520325\n005420120\n006474696\n005520325\n",
            "test2.txt": "005420120\n005520325\n006474696\n006620165\n006620169\n",
            "test3.txt": "005420120\n005420120\n005420120\n005420120\n005420120\n",
            "test4.txt": "005420120\n005420120\n005420120\n005520325\n005520325\n006474696\n",
            "test5.txt": "",  # Empty file
        }
        for filename, content in self.test_files.items():
            with open(filename, 'w') as f:
                f.write(content)

    def tearDown(self):
        """Remove the test files after each test."""
        for filename in self.test_files.keys():
            if os.path.isfile(filename):
                os.remove(filename)

    def test_analyze_unique_at_least_twice_and(self):
        """Test the analyze function for different scenarios."""
        test_cases = {
            "test1.txt": (1, 2),  # siren1 and siren2 appear at least twice, siren3 appears unique)")
            "test2.txt": (5, 0),  # All SIRENs appear unique)")
            "test3.txt": (0, 1),  # The same SIREN appears 5 times
            "test4.txt": (1, 2),  # siren1 and siren2 appear at least twice, siren3 appears unique)")
            "test5.txt": (0, 0),  # No SIRENs in an empty file
        }

        for filename, (expected_once, expected_twice) in test_cases.items():
            unique, at_least_twice = analyze(filename)
            self.assertEqual(at_least_twice, expected_twice, f"Failed for file {filename} (at least twice)")
            self.assertEqual(unique, expected_once, f"Failed for file {filename} (unique)")

if __name__ == "__main__":
    unittest.main()
