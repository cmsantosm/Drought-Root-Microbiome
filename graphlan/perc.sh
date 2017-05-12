graphlan_annotate.py --annot perc.annot perc.tree perc_guide1.xml
graphlan_annotate.py --annot perc.ring perc_guide1.xml perc_guide2.xml
graphlan.py perc_guide2.xml perc_tree.png --dpi 300 --size 10 --pad 0
graphlan.py perc_guide2.xml perc_tree.svg --dpi 300 --size 10 --pad 0