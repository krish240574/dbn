 z←layernum glw x;w;hhat0;nin;b;hhat;hhatinput;li;updates;numlayers

 hhat0←⊃x[1] ⍝ use row of input as posterior
 b←⊃x[3] ⍝ biases
 w←⊃x[2] ⍝ weights
 ⍝ calculate hidden layer posterior
 :If layernum>1
     hhat←1 calclatesthhat(layernum)(b)(hhat0)(w)
     hhatinput←hhat
     li←(0)(layernum)(4)
 :Else
     hhatinput←hhat0
     li←(0)(layernum+1)(10) ⍝ indexing from 1 in APL
 :EndIf
 ⍝ create the input nested array here
 input←(hhatinput)(w)((nin,nin)⍴b)(lr)

 ⍝ CD here
     ⍝ update structure : (v1)(w)(b) - v1 is the visible layer output from CD
 updates←li kcontdiv input
 :If layernum=numlayers
     z←updates
 :EndIf
 z←(layernum+1)glw updates
 }
