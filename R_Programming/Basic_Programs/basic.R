#R program to take input from the user (name and age) and display the values. Also print the version of R installation.
{
NAME=readline(prompt="Enter Your Name:")
AGE=readline(prompt="Enter Your Age:")
print(paste("My Name is ",NAME,"And Iam ",AGE,"years old,"))
print(R.version.string)
}
