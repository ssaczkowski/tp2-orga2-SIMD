#include <stdio.h>
#include <stdlib.h>

void read_rgb (char *file, unsigned char *buffer, int rows, int columns);
void printBuffer(unsigned char *buffer, int size);
int write_rgb (char *file, unsigned char *buffer, int rows, int columns);

//void split_rgb (FILE *file, unsigned char buffer[][3], int rows, int columns);
//void printMatrixBuffer(unsigned char buffer[][3], int size);


int main()
{
	
	// IMAGE 
 	FILE *file; 
 	file = fopen("../img/gopher1_2x2.rgb", "r+b"); 
 	int width = 2;
 	int high = 2;
 	int imageSize = width*high;

 	
    // BUFFER 
    unsigned char buffer[imageSize]; 
    
	// POINTER 
	
	char *pointerFile;
	pointerFile = (char*) malloc(imageSize*3);
	
    if(!feof(file)){		
        fread(pointerFile,(imageSize*3), (imageSize), file ); 
    }
    
    //READ RGB
    read_rgb(pointerFile,buffer,high,width);
    
	fclose(file); 
	
	printBuffer(buffer,(imageSize));
    
return 0; 
}



void read_rgb (char *file, unsigned char *buffer, int rows, int columns){
	
    	int indexBuffer= 0; 
    	
		for ( int i = 0 ; i < columns ; i++ ) {
     		for ( int j = 0 ; j < rows ; j++ ) {
     		
     				
         			buffer[indexBuffer]= file[indexBuffer];
         			indexBuffer++;
         		
			}	
		}
		
}


void printBuffer(unsigned char *buffer, int size){
	
		printf("Buffer of %d elements:\n\n\n", size);
		
		for (int i=0 ; i < size; i++){
			
			printf("%d \t\t\t",buffer[i]);
		
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
/*
int write_rgb (char *file, unsigned char *buffer, int rows, int columns){
	
}
*/



