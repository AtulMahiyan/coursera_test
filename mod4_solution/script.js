var names=new Array();
names[0]="Yaakoob";
names[1]="Johnn";
names[2]="Jenn";
names[3]="jasson";
names[4]="pauul";
names[5]="frannk";
names[6]="larry";
names[7]="paula";
names[8]="laurra";
names[9]="jimm";


for (var i = 0; i < names.length; i++) {
	if(names[i].charAt(0)==='J'|| names[i].charAt(0)==='j'){
        console.log("Goodbye "+ names[i])
	}
	else{
		console.log("Hello "+ names[i])
	}
}
