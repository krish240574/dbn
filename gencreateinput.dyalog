 z←gencreateinput
 nin←3 ⍝ for now
 nout←3 ⍝ for now

 ⍝ initialize weights
 a←0.5*(6÷(nin+nout))
 ⍝ http://docs.scipy.org/doc/numpy-1.10.0/reference/generated/numpy.random.uniform.html

 w←(nin,nin)⍴2.21533813,-1.89091279,-1.72203515,2.65102395,1.40473911,2.00397824,-2.59872098,1.31000923,-1.03599682,2.91565727,0.95147631,-3.5434375
 numlayers←2 ⍝ for now
 b←(numlayers,nin)⍴0 ⍝ biases
 ⍝ start with sample of input
 x←(nin,nin)⍴1 ⍝ for now - need to read this in as CSV and pass each row for a CD1
 ⍝xt←(1,nin)⍴x[1;] ⍝ use xt as posterior
 ⍝ create the input nested array here
 input←(xt)(w)((numlayers,nin)⍴b)(lr)
 z←input
