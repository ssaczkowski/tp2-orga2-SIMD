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
	file = fopen("../img/gopher2_2x2.rgb", "r+b"); 
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

void read_rgb (unsigned char *file, unsigned char *buffer, int rows, int columns){
	
    	int indexBuffer= 0; 
		for ( int i = 0 ; i < columns ; i++ ) {
     		for ( int j = 0 ; j < rows ; j++ ) {
     		
         			buffer[indexBuffer]= file[indexBuffer];
         	//		indexBuffer++;
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

