 glw←{
 ⍝ ⍺ - layernum
 ⍝ ⍵ - (w)(b)(b-1)
     hhatinput←(1,nin)⍴x[⍺;] ⍝ use row of input as posterior
 ⍝ calculate hidden layer posterior
     ⍺>1:axt←((1,nin)⍴b[⍺;])+(hhatinput+.×⍵[1]) ⋄ hhat←(1÷(1+*-1*axt)) ⋄ hhatinput←hhat

 ⍝ create the input nested array here
     input←(hhatinput)(⍵[1])((nin,nin)⍴b)(lr)

 ⍝ CD here
     updates←⍺ kcontdiv input
     ⍺≤numlayers:⍺ ∇ updates
     ⍝ update structure : (w)(bi)(bi-1)
     updates
 }
