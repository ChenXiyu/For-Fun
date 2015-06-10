/*
 * =====================================================================================
 *
 *       Filename:  ParseIpAdde.c
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



#include	<stdio.h>
#include	<stdlib.h>
#include	<string.h>

#define Byte unsigned char
#define FourByte unsigned int
#define DEBUG

void	IP_Binary_to_String 			( FourByte IP , Byte *ip )		;
void	Produce_IP_Address			( FourByte *IP , FourByte *NetMask ) 		;
void	IP_String_2_Numeric 			( const char *IP_String , Byte *ip ) 		;
void	Construct_IP_and_NetMask	 	( Byte *ip ,  FourByte *IP , FourByte *NetMask)	;

	int
main ( int argc, char *argv[] )
{
	Byte ip [ 5 ] ;

	FourByte *NetMask = ( FourByte * )( malloc( sizeof( FourByte ) ) ) ;

	FourByte *IP = ( FourByte * )( malloc( sizeof( FourByte ) ) );

	IP_String_2_Numeric( argv[ 1 ] , ip )	;

	Construct_IP_and_NetMask( ip , IP , NetMask )	;

	Produce_IP_Address( IP , NetMask ) ;

	return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  IP_String_2_Numeric
 *  Description:  用于将命令行参数字符串类型的ip地址和netMask 转为当个数字。
 *  		  比如参数为：“10.42.0.1/24”调用该函数，能将ip地址中出现的5个数字
 *  		  解析出来，存储在数组变量ip[]中，方便后面使用
 * =====================================================================================
 */
	void
IP_String_2_Numeric	( const char *IP_String , Byte *ip )
{
	
	Byte n ;
	const char *c = IP_String ;
	Byte *s	= ip ;
	for ( ; *c != '\0' ; c++ ) {
		if( '.' == *c  || 92 == *c || '/' == *c ){
			if( n <= 255 ){
				*s = n ;
				s++ ;
				n = 0 ;
				continue ;
			}
			else{
				printf( "bad parameter: exit;\n");	
				exit(1) ;
			}
		}
		n = ( n * 10 ) + ( int )( *c - 48 ) ;
	}
	*s = n ;
	return ;
}		/* -----  end of function Parse_IP_2_Numeric  ----- */


/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  Construct_IP_and_NetMask
 *  Description:  从数组ip[]中使用位运算构造出32位的IP地址和NetMask。
 *  		  该32位IP地址类型为FourByte。
 * =====================================================================================
 */
	void
Construct_IP_and_NetMask ( Byte *ip ,  FourByte *IP , FourByte *NetMask)
{
	/*******initial IP ************/

	Byte one = 1 ;
	Byte zero = 0 ; 
	int i ;
	int n = ( int )( ip [ 4 ] ) ;
	for( i = 0 ; i < 4 ; i ++ ){
		*IP &= zero ;
		*IP <<= 8;
	}

	/*******construct IP***********/

	for( i = 0 ; i < 4 ; i ++ ){
		*IP <<= 8 ;
		*IP |= ip[i];
	}

	/*******initial NetMask********/
	for( i = 0 ; i < 4 ; i ++ ){
		*NetMask <<= 8;
		*NetMask &= zero ;
	}

	/*******construct NetMask***********/


	for ( i = 0 ; i < 32 ; i++ ){
		*NetMask <<= 1;
		if ( i < n ){
			*NetMask |= one ;
		}
		else{
			*NetMask |= zero ;
		}
	}
	
	return ;
}		/* -----  end of function Construct_IP_and_NetMask  ----- */

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  Produce_IP_Address
 *  Description:  根据FourByte类型的IP地址和NetMask来产生该网段内的IP地址
 *  		  此IP地址也是FourByte类型的，经过函数IP_Binary_to_String可以转换Byte类型的4个数字
 *  		  然后输出。
 * =====================================================================================
 */
	void
Produce_IP_Address ( FourByte *IP , FourByte *NetMask )
{
	Byte ip[4] ;
	FourByte NetNumber , IpNumber ;
	NetNumber = ( *IP ) & ( *NetMask ) ;
	IpNumber  = ( ~( *NetMask ) & *IP );

	for ( ;IpNumber < ~( *NetMask ) ; IpNumber += 1 ){
		IP_Binary_to_String( (NetNumber | IpNumber ) , ip ) ;
		printf("%d.%d.%d.%d\n",ip[ 0 ] , ip[ 1 ] , ip[ 2 ] , ip[ 3 ] );
	}
	return ;
}		/* -----  end of function Produce_IP_Address  ----- */


/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  IP_Binary_to_String
 *  Description:  将FourByte类型的IP地址转换成字符串。以便输出。
 * =====================================================================================
 */
	void	
IP_Binary_to_String ( FourByte IP , Byte *ip )
{
	
	/*-----------------------------------------------------------------------------
	 * Point ip =====>> Byte ip[4];
	 *-----------------------------------------------------------------------------*/
	int i ; 

	for ( i = 3 ; i >= 0 ; i -- ){
		ip[ i ] = IP; 
		IP >>= 8 ; 
	}
	return ;
}		/* -----  end of function IP_Binary_to_String  ----- */

