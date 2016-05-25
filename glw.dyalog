 glw←{
 ⍝ ⍺ - layernum
 ⍝ ⍵ - (w)(b)(v1)
     hhat0←(1,nin)⍴x[⍺;] ⍝ use row of input as posterior
 ⍝ calculate hidden layer posterior
     ⍺>1:axt←((1,nin)⍴b[⍺;])+(hhat0+.×⍵[1]) ⋄ hhat←(1÷(1+*-1*axt)) ⋄ hhatinput←hhat
     ⍺≤1:hhatinput←hhat0
 ⍝ create the input nested array here
     input←(hhatinput)(⍵[1])((nin,nin)⍴b)(lr)

 ⍝ CD here
     updates←⍺ kcontdiv input
     ⍺≤numlayers:(⍺+1)∇ updates
     ⍝ update structure : (w)(bi)(bi-1)
     updates
 }
