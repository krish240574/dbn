nput
z←gencreateinput
 layernum←1 ⍝ for now
 nin←(-1)↑(⍴sample)
 nout←nin
 lr←0.0001 ⍝ for now
 ⍝ initialize weights
 a←0.5*(6÷(nin+nout))
 ⍝ http://docs.scipy.org/doc/numpy-1.10.0/reference/generated/numpy.random.uniform.html

 tmp←DealWithCsv'c:\users\lenovo1\tmp.txt' ⍝ 28X28 randoom numbers, uniformly distributed b/w
 ⍝ (-a/4) and (a/4)
 w←⊃,/(((nin),(nin))⍴(tmp)) ⍝ ⊃ and ,/ for removing the nesting on each item -- aargh
 numlayers←2 ⍝ for now
 b←(numlayers,nin)⍴0 ⍝ biases


 ⍝ create the input nested array here
 ⎕←'Input is as follows :'
 ⎕←'1. Row of input, with class(Y) added'
 ⎕←'2. Weights between v and h - 28X29'
 ⎕←'3. Biases for each layer'
 ⎕←'4. Learning rate'

 input←(sample)(w)((numlayers,nin)⍴b)(lr)
 z←input
