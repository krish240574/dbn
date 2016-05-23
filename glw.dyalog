 glw←{
     hhatinput←(1,nin)⍴x[layernum;] ⍝ use row of input as posterior
 ⍝ calculate hidden layer posterior
     layernum≥1:axt←((1,nin)⍴b[layernum;])+(hhatinput+.×w) ⋄ hhat←(1÷(1+*-1*axt)) ⋄ hhatinput←hhat

 ⍝ create the input nested array here
     input←(hhatinput)(w)((nin,nin)⍴b)(lr)

 ⍝ CD here
     updates←layernum kcontdiv input
     layernum<l:layernum ∇ updates
     updates
 }
