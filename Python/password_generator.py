import random
import array

# Configuration
maxlen = 20
digits = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
lowcase = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
upcase = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
symbols = ['@', '!', '#', '$', '%', '^', '&', '*', '(', ')', '_', '-', '<', '+', '=', '.', '/', ';']

# Combine all character sets
combo = digits + lowcase + upcase + symbols

# Ensure password includes at least one character from each set
rand_digit = random.choice(digits)
rand_lowcase = random.choice(lowcase)
rand_upcase = random.choice(upcase)
rand_symbol = random.choice(symbols)

# Generate the rest of the password
temp = rand_digit + rand_upcase + rand_symbol + rand_lowcase
for _ in range(maxlen - 4):
    temp += random.choice(combo)

# Convert to a list and shuffle
temp_list = list(temp)
random.shuffle(temp_list)

# Create the final password string
password = ''.join(temp_list)

# Print the result
print("\t\t\t+_+_+_+_+_+////PASSWORD GENERATOR////+_+_+_+_+_+")
print("The Generated Password is:", password)
