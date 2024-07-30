import cv2  # Import the OpenCV library for image and video processing
# the below is the source from where i learned to code this program
# https://www.datacamp.com/tutorial/face-detection-python-opencv
# Load the pre-trained Haar Cascade classifier for face detection
face_classifier = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")

# Start video capture from the default camera (usually the built-in webcam)
video_capture = cv2.VideoCapture(0)

# Define the function to detect faces and draw bounding boxes
def detect_bounding_box(vid):
    gray_image = cv2.cvtColor(vid, cv2.COLOR_BGR2GRAY)  # Convert the frame to grayscale
    faces = face_classifier.detectMultiScale(gray_image, 1.1, 5, minSize=(40, 40))  # Detect faces in the grayscale image
    for (x, y, w, h) in faces:  # For each detected face, draw a rectangle around it
        cv2.rectangle(vid, (x, y), (x + w, y + h), (0, 255, 0), 4)  # Draw the rectangle with green color and thickness of 4
    return faces  # Return the detected faces

# Main loop to continuously capture video frames and perform face detection
while True:
    result, video_frame = video_capture.read()  # Read frames from the video
    if not result:  # Check if the frame was captured successfully
        break  # Terminate the loop if the frame is not read successfully

    faces = detect_bounding_box(video_frame)  # Apply the face detection function to the video frame

    # Display the processed frame in a window named "My Face Detection Project"
    cv2.imshow("My Face Detection Project", video_frame)

    # Break the loop on 'q' key press
    if cv2.waitKey(1) & 0xFF == ord("q"):
        break

# Release the video capture object and close all OpenCV windows
video_capture.release()
cv2.destroyAllWindows()
