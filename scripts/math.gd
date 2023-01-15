extends StaticBody


var is_dualogue_continue = false


func interact(inventory, targets, dialogue):
	dialogue.SpeakerIs("Математика")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo('$⊫;≏⊄[&>≵?,<9%>ℶ≵0;ℶ≾45⊫≑�⊫⋽*∜⋣ℤ&⋒⋒}⋈∞!⊫≏$*⊄<≏≏≹8⨔^${⩲}})∃≾+ℶ%⊄{⋩4{9∜8≬$9{ℶ⋒∰ℤ/∺≾*_ℤ∜|⊛≑;$≈∀.≍⨔⋒:⊛!!*7ℶ(8∀ℤ≑≈ℶ,1≍]/!ℵ⋽⋩)?∃⩲∞;≂⊛:ℵ>_∺≵∅≏⨙:&?1⨙⩲*ℤ⊄7⊫')
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false
