#include <stdio.h>

/*
int read_rgb (char *file, unsigned char *buffer, int rows, int columns);
int write_rgb (char *file, unsigned char *buffer, int rows, int columns);
*/

void printBuffer(unsigned char buffer[][3], int size);

int main()
{
	

	// IMAGE 
 	FILE *file; 
 	file = fopen("../img/gopher1_2x2.rgb", "r+b"); 
 	int width = 2;
 	int high = 2;
 	

 	
    //CHANNELS & BUFFER 
	unsigned char byte_R; 
    unsigned char byte_G;
    unsigned char byte_B;
    unsigned char buffer[width*high][3]; 
     
     
    	for ( int i = 0 ; i < width ; i++ ) {
     		for ( int j = 0 ; j < high ; j++ ) {
   				if(!feof(file)){
   				
         			byte_R=fgetc(file); 
         			byte_G=fgetc(file) + 8;
         			byte_B=fgetc(file) + 16;
         			
         			buffer[i][0]= byte_R;
         			buffer[i][1]= byte_G;
         			buffer[i][2]= byte_B;
         				
				}
			}	
		}
		
		printBuffer(buffer,(width*high));
		
		fclose(file); 
	  
     
return 0; 
}


void printBuffer(unsigned char buffer[][3], int size){
		printf("\n\nBUFFER RGB\n\n 0 = R\t1 = G\t2 = B\n\n\n");
		printf("Image of %d elements per channel.\n\n\n", size);
		
		for (int i=0 ; i < size; i++){
			for (int j=0 ;j < 3 ;j++)
			{
				printf("(%d,%d)=%d \t\t\t", i,j,buffer[i][j]);
			}
			printf("\n");	
		}
}


/*
int leer_rgb (char *archivo, unsigned char *buffer, int filas, int columnas){
		
}


int escribir_rgb (char *archivo, unsigned char *buffer, int filas, int columnas){
	
}

*/



