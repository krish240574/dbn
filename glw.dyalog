 glw←{
 ⍝ ⍺ - layernum
 ⍝ ⍵ - (w)(b)(v1)
     hhat0←(1,nin)⍴⍵[⍺;] ⍝ use row of input as posterior
     b←⊃⍵[2] ⍝ biases
 ⍝ calculate hidden layer posterior
     ⍺>1:axt←((1,nin)⍴b[⍺;])+(hhat0+.×⍵[1]) ⋄ hhat←(1÷(1+*-1*axt)) ⋄ hhatinput←hhat ⋄ li←(⍺)(4)
     ⍺≤1:hhatinput←hhat0 ⋄ li←(⍺)(10)
 ⍝ create the input nested array here
     input←(hhatinput)(⍵[1])((nin,nin)⍴b)(lr)

 ⍝ CD here
     ⍝ update structure : (w)(b)(v1) - v1 is the visible layer output from CD
     updates←li kcontdiv input
     ⍺=numlayers:updates
     ⍺≤numlayers:(⍺+1)∇ updates
 }
