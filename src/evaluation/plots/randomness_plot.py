import matplotlib.pyplot as plt
plt.rcParams.update({'font.size': 22})

if __name__ == "__main__":
    with open('../data/randomness.txt') as f:
        challenges = f.readline().split(' = ')[-1].strip()
        responses = f.readline().split(' ')[-1].strip()
    
    responses = [int(c) for c in responses]
    num_responses = len(responses)

    x_values = list(range(1, num_responses + 1))

    plt.figure(figsize=(10, 5))
    plt.plot(x_values, responses, marker='o', linestyle='-', color='b', label='PUF Response')

    plt.xlabel("Test Number")
    plt.ylabel("Response (0 or 1)")
    plt.yticks([0, 1], ['0', '1'])
    plt.legend()
    plt.grid(alpha=0.3)

    plt.tight_layout()
    plt.show()