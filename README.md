# AnimatedStars

A customisable animation package that generates a burst of starts that rises from the bottom to the top of the screen and then disappears. Images can be customised to create other effects (e.g. bubbles, hearts... anything you like)!


## USAGE:

1. Create an AnimatedStars object:
===============================
var animatedStars = AnimatedStars() [with customisation]
let animatedStars = AnimatedStars() [without customisation]

2. Apply any customisations from the following options:
==============================================
animatedStars.numberOfStars = 50
animatedStars.starSizeMinimum = 20
animatedStars.starSizeMaximum = 50
animatedStars.riseTimeMin = 0.8
animatedStars.riseTimeMax = 3.0
animatedStars.starImage = UIImage(systemName: "star.fill")?.withTintColor(UIColor.yellow, renderingMode: .alwaysOriginal)

3. Trigger the animation:
==============================
animatedStars.animateStars(vc: self)
