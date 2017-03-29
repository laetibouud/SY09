notes <- read.csv("sy02-p2016.csv", na.strings="", header=T)
notes$nom <- factor(notes$nom, levels=notes$nom)
notes$correcteur.median <- factor(notes$correcteur.median, levels=c("Cor1","Cor2","Cor3","Cor4","Cor5","Cor6","Cor7","Cor8"))
notes$correcteur.final <- factor(notes$correcteur.final, levels=c("Cor1","Cor2","Cor3","Cor4","Cor5","Cor6","Cor7","Cor8"))
notes$niveau <- factor(notes$niveau, ordered=T)
notes$resultat <- factor(notes$resultat, levels=c("F","Fx","E","D","C","B","A"), ordered=T)

x11()
par(mar=c(5, 4, 4, 8), xpd=TRUE)
boxplot(notes$note.total~notes$specialite,col=c("blue","pink","green","yellow","red","purple","white","orange","cyan3"), main="Notes finales des etudiants en fonction
																															de leur branche")
legend(11,16,xpd=NA,inset=0.05, title="Legende",c("GB", "GI","GM", "GP","GSM" ,"", "Hutech","","TC"), 
	fill=c("blue","pink","green","yellow","red","purple","white","orange","cyan3"), horiz=FALSE)

x11()
counts <- table(notes$dernier.diplome.obtenu, notes$resultat)
selectcounts <- counts[c("BAC","CPGE","DUT"),]
barplot(selectcounts, main="Notes finales de SY02 en fonction du 
							dernier diplome obtenu de l'etudiant",
  xlab="Note finale", col=c("darkblue","cyan3","pink"),
 	legend = rownames(selectcounts), beside=TRUE)

x11()
N <- c(notes$note.median,notes$note.final)
C <- c(notes$correcteur.median,notes$correcteur.final)

boxplot(N~C)


