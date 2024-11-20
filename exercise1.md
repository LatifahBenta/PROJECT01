## PROJECT_DENGUE EXERCISE.

The following code was used to **create the project directory**

`mkdir -p project_dengue{Data/{Raw,processed},codes}`

There are two ways to link your directory  to github

 #### Cloning using the following code

 Here you first need to create your github repository and clone it on your local terminal using the url

`git clone: url`

#### Initialising your directory as a repository
If you already have the directory in your local terminal like me and want to link it to a repository on your github. Just initialize!! 😃

Follow these steps to do that 

```
 cd path/to/project_dengue

git init 

git remote add origin place/the/url/here

git remote -v

```

Now you can comfortably **push** file from your terminal to github

To get the **number of files in the zipped file**. Run the following code:

`unzip -l dengue.zip | grep -c "^[ ]*[0-9]" `

The first part of the code is meant to list the contents of the zipped file including the sizes, date and time 

The second part of the code is meant to search for patterns, here we are looking for lines that begin with a space and followed by integers and counting this lines . Remember thi s is done on the output of the first part of the code👍

Another code that can be used here is   **_5_**

`unzip -Z1 dengue.zip | wc -l`

The output for this is 

Here we are listing the file names without details like size and date of the zipped file and counting each line of the output.

To **get the number of lines in each file** do the following

```
cd dengue

wc -l *.fasta | head -n -1

```

The output is 

| File name | No. of lines|
|------------|------------|
|dengueseq1.fasta| 42|
|dengueseq2.fasta| 115|
|dengueseq3.fasta| 94|
|dengueseq4.fasta|113|
|dengueseq5.fasta|157|

The number of lines in all the files combined is **521**

To merge all the files into one fasta file, you can run the code 

`cat dengueseq*.fasta >> dengue_merged.fasta`

This code will append all the fasta files into one file. Your file should have 521 lines 😉

To get the number of headers in the merged file. Run the code

`grep ">" dengue_merged.fasta | wc -l`

The output is **5**

To get the number of sequences in your merged sequence file run the following command;

`grep -c ">" dengue_merged.fasta`

This counts the number of lines that begin with the special character ">". Remember the format of a fasta file 😉 The output is **5**

Extracting the headers of the merged fasta file and putting them in a different file using the code

`grep "^>" dengue_merged.fasta > dengue_headers.txt`

This line of code looks for lines that begin with > and prints them into the redirected output. You can check your output using the 
`ls dengue_headers.txt` 

Extracting only the names of the virus and creating a new file called viruses.txt use
`awk '{print $2 " " $3} dengue_headers.txt> viruses.txt`

This will print the second and third field of the given file and instead of printing the output on the screen redirects it to a file called viruses.txt








