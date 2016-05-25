 kcontdiv←{
 ⍝ x;b;w;lr;v0;v1;h0hat;h1hat;bias;h0;h1;nin;biash;biasv
 ⍝ CD-n
 cdn←⍺[2] ⍝ number of iterations of the Gibb's chain
 l←⍺[1] ⍝ layer number

 b←⊃⍵[3] ⍝ biases for layer l

 w←⊃⍵[2]

 lr←⊃⍵[4]

 v0←⊃⍵[1]
 nin←((-1)↑(⍴b))
 h0hat←⊃⍵[1] ⍝ initialize posterior of visible as input

 biash←((1,nin)⍴b[l;])  ⍝ 2 is for the hidden layer, layer 2
 h1hat←1÷(1+*-1×biash+v0+.×⍉w)

 ⍝ Repeat of h1hat calculation
 ⍝ h0 ← P(h|v0)
 ⍝h0←1÷(1+*-1×b+v0+.×⍉w) ⍝ change to Gaussian later


 ⍝ v1← P(v|h0)
 biasv←((1,nin)⍴b[l;])
 v1←1÷(1+*-1×biasv+h1hat+.×w) ⍝ change to Gaussian later

 ⍝ Update:

⍝ ⎕←'Updates are in the following format :'
⍝ ⎕←'1. Weights after CD1'
⍝ ⎕←'2. Biases of layer 1(visible layer)'
⍝ ⎕←'3. Values of visible layer after CD1
 w←w+lr×((h1hat+.×⍉v0)-(h1hat+.×⍉v1))
 b[l;]←b[l;]+lr×(h0hat-h1hat)
 b[l-1;]←b[l;]+lr×(v0-v1)
 (w)(b)(v1) ⍝ updates as nested array
 }
