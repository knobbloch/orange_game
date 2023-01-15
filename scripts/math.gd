extends StaticBody


func interact(inventory, targets, dialogue):
	dialogue.SpeakerIs("Математика")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.is_dualogue_continue=true
		dialogue.object = self
		dialogue.ChangeTextTo('$⊫;≏⊄[&>≵?,<9%>ℶ≵0;ℶ≾45⊫≑�⊫⋽*∜⋣ℤ&⋒⋒}⋈∞!⊫≏$*⊄<≏≏≹8⨔^${⩲}})∃≾+ℶ%⊄{⋩4{9∜8≬$9{ℶ⋒∰ℤ/∺≾*_ℤ∜|⊛≑;$≈∀.≍⨔⋒:⊛!!*7ℶ(8∀ℤ≑≈ℶ,1≍]/!ℵ⋽⋩)?∃⩲∞;≂⊛:ℵ>_∺≵∅≏⨙:&?1⨙⩲*ℤ⊄7⊫')
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null
