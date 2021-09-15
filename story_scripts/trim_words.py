import os

def trim_stories(sentence_length=300):
    data = ["train", "test", "valid"]
    input_folder = "writingPrompts"
    output_folder = f"writingPrompts_{sentence_length}"

    os.makedirs(output_folder, exist_ok=True)

    for name in data:
        with open(os.path.join(input_folder, f"{name}.wp_target"), 'r') as f:
            stories = f.readlines()

        stories = [" ".join(i.split()[0:sentence_length]) for i in stories]

        with open(os.path.join(output_folder, f"{name}.wp_target"), "w") as o:
            for line in stories:
                o.write(line.strip() + "\n")

def main():
    trim_stories()

if __name__ == "__main__":
    main()
