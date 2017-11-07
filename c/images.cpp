#include <stdio.h>
#include <stdlib.h>

void read_rgb (unsigned char *file, unsigned char *buffer, int rows, int columns);
void printBuffer(unsigned char *buffer, int size);
void write_rgb (unsigned char *file, unsigned char *buffer, int rows, int columns);
void printFile(unsigned char *file, int size);

//void split_rgb (FILE *file, unsigned char buffer[][3], int rows, int columns);
//void printMatrixBuffer(unsigned char buffer[][3], int size);


int main()
{	
	// IMAGE 
 	FILE *file; 
 	int width = 2;
 	int high = 2;
 	int imageSize = width*high;
    // BUFFER 
    unsigned char buffer[imageSize]; 
    unsigned char buffer2[imageSize]; 
    // READ RGB 
	unsigned char *pointerFileRead;
	pointerFileRead = (unsigned char*) malloc(imageSize*3);
	
	//IMAGE 1
	file = fopen("../img/gopher1_2x2.rgb", "r+b"); 
	if(!feof(file)){
	printf ("PRIMER IMAGEN\n");		
    fread(pointerFileRead,(imageSize*3), (imageSize), file );     
    read_rgb(pointerFileRead,buffer,high,width);
    fclose(file); 
	printBuffer(buffer,(imageSize));
	}
	free(pointerFileRead);

	//IMAGE 2
	//pointerFileRead = (unsigned char*) malloc(imageSize*3);
	pointerFileRead = (unsigned char*) malloc(imageSize*3);
	file = fopen("../img/gopher1_2x2.rgb", "r+b"); 
	
	if(!feof(file)){		
	printf ("\n\nSEGUNDA IMAGEN\n");
    fread(pointerFileRead,(imageSize*3), (imageSize), file );     
    read_rgb(pointerFileRead,buffer2,high,width);
    fclose(file); 
	printBuffer(buffer2,(imageSize));
	}
	free(pointerFileRead);


	return 0;
}

void write_rgb ( char *file, unsigned char *buffer, int rows, int columns){
	
	 	int indexBuffer= 0; 
    	
		for ( int i = 0 ; i < columns ; i++ ) {
     		for ( int j = 0 ; j < rows ; j++ ) {
     		
     				
         			file[indexBuffer]= buffer[indexBuffer];
         			indexBuffer++;
         		
			}	
		}
		
}

void read_rgb (unsigned char *file, unsigned char *buffer, int rows, int columns){
	
    	int indexBuffer= 0; 
		for ( int i = 0 ; i < columns ; i++ ) {
     		for ( int j = 0 ; j < rows ; j++ ) {
     		
         			buffer[indexBuffer]= file[indexBuffer];
         			printf ("file: %d : Buffer: %d\n",file[indexBuffer],buffer[indexBuffer]); 
					indexBuffer++;       		
			}	
		}
		system("pause");
		
}


void printBuffer(unsigned char *buffer, int size){
	
		printf("\nBuffer of %d elements:\n\n\n", size);
		
		for (int i=0 ; i < size; i++){
			
			printf("%d \t\t\t",buffer[i]);
		
			printf("\n");	
		}
}


void printFile(  char *file, int size){
	
		printf("\nFile of %d elements:\n\n\n", size);
		
		for (int i=0 ; i < size; i++){
			
			printf("%d \t\t\t",file[i]);
		
			printf("\n");	
		}
}



/*
void printMatrixBuffer(unsigned char buffer[][3], int size){
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
*/
/*
void split_rgb (FILE *file, unsigned char buffer[][3], int rows, int columns){
		unsigned char byte_R; 
    	unsigned char byte_G;
    	unsigned char byte_B;
    		
		for ( int i = 0 ; i < columns ; i++ ) {
     		for ( int j = 0 ; j < rows ; j++ ) {
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
		
		printBuffer(buffer,(columns*rows));
		
		fclose(file); 
			
} 
*/



