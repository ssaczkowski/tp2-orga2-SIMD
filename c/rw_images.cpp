#include <stdio.h>

/*
int leer_rgb (char *archivo, unsigned char *buffer, int filas, int columnas);
int escribir_rgb (char *archivo, unsigned char *buffer, int filas, int columnas);
*/

void printMatrix(unsigned char img[100][114]);

int main()
{
	
	

 	 FILE *pFichero; 
     unsigned char byte; /* Un char suele ser 8 bits = byte (No siempre)  */ 
     pFichero=fopen("../img/gopher1.rgb", "r+b"); // Img RGB 100x114
     
     unsigned char img[100][114];
     
     
    	for ( int i = 0 ; i < 100 ; i++ ) {
     		for ( int j = 0 ; j < 114 ; j++ ) {
   				if(!feof(pFichero)){
   					printf("En el if del for %d %d",i,j); // for debug
         			byte=fgetc(pFichero); /* Cada vez que es invocada la funcion fgetc el puntero del fichero se incrementa un byte */ 
      	 			img[i][j] = byte;
				}
			}	
		}
		

	  fclose(pFichero); 
	  printMatrix(img);
	  
     
return 0; 
}


void printMatrix(unsigned char img[100][114]){
	
		for (int i=0;i < 100;i++){
			for (int j=0;j < 114;j++)
			{
				printf("Elemento ( %d , %d ) de matriz imagen: %d ", i,j,img[i][j]);
			}	
		}
}

/*
int leer_rgb (char *archivo, unsigned char *buffer, int filas, int columnas){
		
}


int escribir_rgb (char *archivo, unsigned char *buffer, int filas, int columnas){
	
}

*/



