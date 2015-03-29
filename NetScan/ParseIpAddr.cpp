/*
 * =====================================================================================
 *
 *       Filename:  ParseIpAdde.cpp
 *
 *    Description:  Parse the ip address and net mask,I will use it in my NetScan shell Script
 *
 *        Version:  1.0
 *        Created:  03/27/2015 11:43:33 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  XiyuChen (XYC), c272717012@gmail.com
 *        Company:  nwsuaf
 *
 * =====================================================================================
 */


#include	<iostream>
#include	<stdlib.h>
#include	<string.h>

using namespace std;

void ParseIP ( const char *IP , short *ip ) ;

	int
main ( int argc, char *argv[] )
{
	short 	ip[5] ;

//	ParseIP( argv[1] , ip ) ;
	
	short int n = ip[ 4 ] / 8 ;
	cout << sizeof(short);
	switch ( n ){
		case 0:;
		case 1:;
		case 2:;
		case 3:;
	}
	return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


	void
ParseIP ( const char *IP , short *ip )
{
	
	short n ;
	const char *c = IP ;
	short int *s = ip ;
	for ( ; *c != '\0' ; c++ ) {
		if( '.' == *c  || 92 == *c || '/' == *c ){
			if( n <= 255 ){
				*s = n ;
				s++ ;
				n = 0 ;
				continue ;
			}
			else{
				cout << "bad parameter: exit;" << endl ;	
				exit(1) ;
			}
		}
		n = ( n * 10 ) + ( int )( *c - 48 ) ;
	}
	*s = n ;
	return ;
}		/* -----  end of function ParseIP  ----- */
