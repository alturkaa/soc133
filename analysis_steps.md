#### Analysis Steps

1) What is the dependent variable?

2) Is it categorical or continuous? If it's categorical, how many different answers could someone give to this question?

3) What is its distribution? 

4) How do you visualize just this distribution?

5) What is the independent variable?

6) Is it categorical or continuous? If it's categorical, how many different answers could someone give to this question?

7) What is its distribution? 

8) How do you visualize just this distribution?

9) Create a group_by, summarize table to see how these two variables relate to each other.

- Make sure to include na.rm = TRUE
- Use the arrange function at the end of the code chunk.
- After you like what you see, put a name at the beginning of the code and <- to save it to a table in RStudio.
- Copy and paste this table, or use the write.table function to export it to a .txt file that you can then paste into Word.

10) Visualize your data (multiple ways to do this -- see .R code).

- Think about adding coord_flip()
- Think about ordering your bars in a way that looks nice.
- Add labels to your graph and possibly change the theme. 

11) Save your graph, either by clicking on Export in bottom right corner, or doing the following:

- After you like what you see, put a name at the beginning of the code and <- to save it.
- Use ggsave('name_chart.jpg', name_graph_you_just_created)

12) To see how relationship between two variables may depend on third variable, think about using the following:

- Add the third variable to your group_by parentheses. 
- At end of a graph of the first two variables, add facet_wrap(~ third_variable)

