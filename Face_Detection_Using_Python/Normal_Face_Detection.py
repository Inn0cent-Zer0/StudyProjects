import cv2
import matplotlib.pyplot as plt
# the below is the source from where i learned to code this program
# https://www.datacamp.com/tutorial/face-detection-python-opencv
# Path to the input image
imagePath = 'input.jpg'

# Read the image
img = cv2.imread(imagePath)

# Print the dimensions of this array
print("Original image shape:", img.shape)

# Convert the image to grayscale
gray_image = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Print dimensions of the grayscale image
print("Grayscale image shape:", gray_image.shape)

# Load the pre-trained Haar Cascade classifier
face_classifier = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")

# Perform face detection
faces = face_classifier.detectMultiScale(gray_image, scaleFactor=1.1, minNeighbors=5, minSize=(40, 40))

# Drawing bounding boxes around detected faces
for (x, y, w, h) in faces:
    cv2.rectangle(img, (x, y), (x + w, y + h), (0, 255, 0), 4)

# Convert the image to RGB for displaying with matplotlib
img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

# Display the image with bounding boxes
plt.figure(figsize=(20, 10))
plt.imshow(img_rgb)
plt.axis('off')
plt.show()
