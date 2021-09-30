ÿ
wC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Entities\Actor.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Entities %
{		 
public

 

class

 
Actor

 
{ 
[ 	
Key	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
[ 	
StringLength	 
( 
maximumLength #
:# $
$num% (
,( )
MinimumLength* 7
=8 9
$num: ;
); <
]< =
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
Required	 
] 
[ 	
StringLength	 
( 
maximumLength #
:# $
$num% (
,( )
MinimumLength* 7
=8 9
$num: ;
); <
]< =
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
ICollection 
< 

Screenplay %
>% &
Screenplays' 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} ñ
yC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Entities\AppRole.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Entities %
{		 
public

 

class

 
AppRole

 
:

 
IdentityRole

 '
<

' (
int

( +
>

+ ,
{ 
public 
ICollection 
< 
AppUserRole &
>& '
	UserRoles( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
} ç
yC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Entities\AppUser.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Entities		 %
{

 
public 

class 
AppUser 
: 
IdentityUser '
<' (
int( +
>+ ,
{ 
[ 	
StringLength	 
( 
maximumLength #
:# $
$num% (
,( )
MinimumLength* 7
=8 9
$num: ;
); <
]< =
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
StringLength	 
( 
maximumLength #
:# $
$num% (
,( )
MinimumLength* 7
=8 9
$num: ;
); <
]< =
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
ICollection 
< 
AppUserRole &
>& '
	UserRoles( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
ICollection 
< 
Booking "
>" #
Bookings$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
=; <
null= A
;A B
} 
} ˚
}C:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Entities\AppUserRole.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Entities %
{		 
public

 

class

 
AppUserRole

 
:

 
IdentityUserRole

 /
<

/ 0
int

0 3
>

3 4
{ 
public 
AppUser 
User 
{ 
get !
;! "
set# &
;& '
}( )
public 
AppRole 
Role 
{ 
get !
;! "
set# &
;& '
}( )
} 
} …
yC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Entities\Booking.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Entities %
{		 
public

 

class

 
Booking

 
{ 
[ 	
Key	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
ICollection 
< 
Ticket !
>! "
Tickets# *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
Required	 
] 
public 
AppUser 
AppUser 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} …

xC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Entities\Rating.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Entities		 %
{

 
public 

class 
Rating 
{ 
[ 	
Key	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
[ 	
Range	 
( 
$num 
, 
$num 
) 
] 
public 
int 
Rate 
{ 
get 
; 
set "
;" #
}$ %
[ 	
Required	 
] 
public 
int 
ScreenplayId 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	

ForeignKey	 
( 
$str "
)" #
]# $
public 

Screenplay 

Screenplay $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} 
|C:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Entities\Screenplay.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Entities		 %
{

 
public 

class 

Screenplay 
{ 
[ 	
Key	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
[ 	
StringLength	 
( 
maximumLength #
:# $
$num% (
,( )
MinimumLength* 7
=8 9
$num9 :
): ;
]; <
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
[ 	
StringLength	 
( 
maximumLength #
:# $
$num% )
,) *
MinimumLength+ 8
=9 :
$num; =
)= >
]> ?
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
DataType	 
( 
DataType 
. 
Date 
)  
]  !
public 
DateTime 
ReleaseDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
ICollection 
< 
Actor  
>  !
Actors" (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
=7 8
null9 =
;= >
public 
ICollection 
< 
Rating !
>! "
Ratings# *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
=9 :
null; ?
;? @
public 
ICollection 
< 
Ticket !
>! "
Tickets# *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
=9 :
null; ?
;? @
[ 	
Required	 
] 
[ 	
EnumDataType	 
( 
typeof 
( 
Category %
)% &
)& '
]' (
public 
Category 
Category  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
	MaxLength	 
( 
$num 
, 
ErrorMessage $
=% &
$str' S
)S T
]T U
public 
string 
PhotoUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
}   ¬
xC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Entities\Ticket.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Entities		 %
{

 
public 

class 
Ticket 
{ 
[ 	
Key	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
public 
int 
ScreenplayId 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	

ForeignKey	 
( 
$str "
)" #
]# $
public 

Screenplay 

Screenplay $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
? 
	BookingId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	

ForeignKey	 
( 
$str 
)  
]  !
public 
Booking 
Booking 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
null/ 3
;3 4
[ 	
DataType	 
( 
DataType 
. 
Date 
)  
]  !
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
bool 
IsAvailable 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
true0 4
;4 5
[ 	
StringLength	 
( 
maximumLength #
:# $
$num% (
,( )
MinimumLength* 7
=8 9
$num: ;
); <
]< =
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ‚
{C:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Enums\AppRolesEnum.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Enums "
{ 
public		 

enum		 
AppRolesEnum		 
{		 
Consumer		 '
=		( )
$num		* +
,		+ ,
Admin		- 2
=		3 4
$num		5 6
}		7 8
}

 ⁄
{C:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Enums\CategoryEnum.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Enums		 "
{

 
public 

enum 
Category 
{ 
Movie  
=! "
$num# $
,$ %
Show& *
=+ ,
$num- .
}. /
} é
ÄC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Exceptions\ApiException.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 

Exceptions '
{ 
public		 

class		 
ApiException		 
{

 
public 
ApiException 
( 
) 
{ 	
} 	
public 
ApiException 
( 
string "
message# *
)* +
{ 	
Message 
= 
message 
; 
} 	
public 
ApiException 
( 
string "
message# *
,* +
	Exception, 5
inner6 ;
); <
{ 	
Message 
= 
message 
; 
Details 
= 
inner 
. 

StackTrace &
;& '
} 	
public 
ApiException 
( 
int 

statusCode  *
,* +
string, 2
message3 :
=; <
null= A
,A B
stringC I
detailsJ Q
=R S
nullT X
)X Y
{ 	

StatusCode 
= 

statusCode #
;# $
Message 
= 
message 
; 
Details 
= 
details 
; 
} 	
public!! 
int!! 

StatusCode!! 
{!! 
get!!  #
;!!# $
set!!% (
;!!( )
}!!* +
=!!, -
$num!!. 1
;!!1 2
public"" 
string"" 
Message"" 
{"" 
get""  #
;""# $
set""% (
;""( )
}""* +
="", -
$str"". E
;""E F
public## 
string## 
Details## 
{## 
get##  #
;### $
set##% (
;##( )
}##* +
}$$ 
}%% ‰

áC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Exceptions\BadRequestException.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 

Exceptions '
{		 
public

 

class

 
BadRequestException

 $
:

% &
	Exception

' 0
{ 
public 
BadRequestException "
(" #
)# $
:% &
base' +
(+ ,
), -
{. /
}0 1
public 
BadRequestException "
(" #
string# )
message* 1
)1 2
:3 4
base5 9
(9 :
message: A
)A B
{C D
}E F
public 
BadRequestException "
(" #
string# )
message* 1
,1 2
params3 9
object: @
[@ A
]A B
argsC G
)G H
: 
base 
( 
String 
. 
Format  
(  !
CultureInfo! ,
., -
CurrentCulture- ;
,; <
message= D
,D E
argsF J
)J K
)K L
{ 	
} 	
} 
} ˝

åC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Exceptions\ForbiddenAccessException.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 

Exceptions '
{		 
public

 

class

 $
ForbiddenAccessException

 )
:

* +
	Exception

, 5
{ 
public $
ForbiddenAccessException '
(' (
)( )
:* +
base, 0
(0 1
)1 2
{3 4
}5 6
public $
ForbiddenAccessException '
(' (
string( .
message/ 6
)6 7
:8 9
base: >
(> ?
message? F
)F G
{H I
}J K
public $
ForbiddenAccessException '
(' (
string( .
message/ 6
,6 7
params8 >
object? E
[E F
]F G
argsH L
)L M
: 
base 
( 
String 
. 
Format  
(  !
CultureInfo! ,
., -
CurrentCulture- ;
,; <
message= D
,D E
argsF J
)J K
)K L
{ 	
} 	
} 
} ⁄

ÖC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Exceptions\NotFoundException.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 

Exceptions '
{		 
public

 

class

 
NotFoundException

 "
:

# $
	Exception

% .
{ 
public 
NotFoundException  
(  !
)! "
:# $
base% )
() *
)* +
{, -
}. /
public 
NotFoundException  
(  !
string! '
message( /
)/ 0
:1 2
base3 7
(7 8
message8 ?
)? @
{A B
}C D
public 
NotFoundException  
(  !
string! '
message( /
,/ 0
params1 7
object8 >
[> ?
]? @
argsA E
)E F
: 
base 
( 
String 
. 
Format  
(  !
CultureInfo! ,
., -
CurrentCulture- ;
,; <
message= D
,D E
argsF J
)J K
)K L
{ 	
} 	
} 
} ∏
ÖC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\MostRatedMoviesReport.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
{		 
public

 

class

 !
MostRatedMoviesReport

 &
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonPropertyName	 
( 
$str +
)+ ,
], -
public 
int 
number_of_ratings $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} Å

ëC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\MostSoldMoviesWithoutRatingReport.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
{		 
public

 

class

 -
!MostSoldMoviesWithoutRatingReport

 2
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonPropertyName	 
( 
$str '
)' (
]( )
public 
int 
tickets_sold 
{  !
get" %
;% &
set' *
;* +
}, -
} 
}  
êC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\MostViewedMoviesForAPeriodReport.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
{		 
public

 

class

 ,
 MostViewedMoviesForAPeriodReport

 1
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
Title 
{ 
get 
; 
set  #
;# $
}% &
[ 	
JsonPropertyName	 
( 
$str +
)+ ,
], -
public 
int 
screening_number #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ‰
yC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\PagedList.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
{ 
public		 

class		 
	PagedList		 
<		 
T		 
>		 
{

 
public 
	PagedList 
( 
List 
< 
T 
>  
items! &
,& '
int( +
count, 1
,1 2
int3 6

pageNumber7 A
,A B
intC F
pageSizeG O
)O P
{ 	
CurrentPage 
= 

pageNumber $
;$ %

TotalPages 
= 
( 
int 
) 
Math "
." #
Ceiling# *
(* +
count+ 0
/1 2
(3 4
double4 :
): ;
pageSize; C
)C D
;D E
PageSize 
= 
pageSize 
;  

TotalCount 
= 
count 
; 
Items 
= 
items 
; 
} 	
public 
int 
CurrentPage 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 

TotalPages 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
PageSize 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 

TotalCount 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
< 
T 
> 
Items 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ∆	
çC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Requests\BookingInsertRequest.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
Requests$ ,
{ 
public		 

class		  
BookingInsertRequest		 %
{

 
public 
int 
? 
	AppUserId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
ScreenplayId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
NumberOfTickets "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ‡
åC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Requests\LoginAccountRequest.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
Requests$ ,
{ 
public		 

class		 
LoginAccountRequest		 $
{

 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ú
ìC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Requests\MostViewedMoviesGetRequest.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
Requests$ ,
{ 
public		 

class		 &
MostViewedMoviesGetRequest		 +
{

 
public 
DateTime 
	StartDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
EndDate 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ⁄
åC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Requests\RatingInsertRequest.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
Requests$ ,
{ 
public		 

class		 
RatingInsertRequest		 $
{

 
public 
int 
Rate 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
ScreenplayId 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ü
èC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Requests\RegisterAccountRequest.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
Requests$ ,
{ 
public		 

class		 "
RegisterAccountRequest		 '
{

 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} √
éC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Requests\ScreenplaysGetRequest.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
Requests$ ,
{		 
public

 

class

 !
ScreenplaysGetRequest

 &
{ 
public 
Category 
Category  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
Category1 9
.9 :
Movie: ?
;? @
public 
string 
Search 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
OlderThanYears !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
NewerThanYear  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
int 
AtLeastStars 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 

ExactStars 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 

PageNumber 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
$num. /
;/ 0
public 
int 
PageSize 
{ 
get !
;! "
set# &
;& '
}( )
=* +
$num, .
;. /
} 
} ó
äC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Requests\TicketsGetRequest.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
Requests$ ,
{ 
public		 

class		 
TicketsGetRequest		 "
{

 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
ScreenplayId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
NumberOfTickets "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} Å
åC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Requests\UpdateTicketRequest.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
Requests$ ,
{ 
public		 

class		 
UpdateTicketRequest		 $
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
? 
	BookingId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
IsAvailable 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ê
âC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Responses\AccountResponse.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
	Responses$ -
{ 
public		 

class		 
AccountResponse		  
{

 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ◊
áC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Responses\ActorResponse.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
	Responses$ -
{ 
public		 

class		 
ActorResponse		 
{

 
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ¬

âC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Responses\BookingResponse.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
	Responses$ -
{ 
public		 

class		 
BookingResponse		  
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
	AppUserId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
NumberOfTickets "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
ScreenplayId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ê
éC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Responses\RatingInsertResponse.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
	Responses$ -
{ 
public		 

class		  
RatingInsertResponse		 %
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
Rate 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
ScreenplayId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
double 
averageRate !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} Û
åC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Responses\ScreenplayResponse.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
	Responses$ -
{ 
public		 

class		 
ScreenplayResponse		 #
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
ReleaseDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
ICollection 
< 
ActorResponse (
>( )
Actors* 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
string 
Category 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
PhotoUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
AverageRate !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
$num2 3
;3 4
} 
} ¸

àC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Models\Responses\TicketResponse.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Models #
.# $
	Responses$ -
{ 
public		 

class		 
TicketResponse		 
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
ScreenplayId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
	BookingId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
bool 
IsAvailable 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
true0 4
;4 5
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ÿ
àC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Repositories\IBookingRepository.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Repositories		 )
{

 
public 

	interface 
IBookingRepository '
{ 
Task 
< 
BookingResponse 
> 
CreateBookingAsync 0
(0 1 
BookingInsertRequest1 E
requestF M
)M N
;N O
} 
} ‹
áC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Repositories\IRatingRepository.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Repositories		 )
{

 
public 

	interface 
IRatingRepository &
{ 
Task 
<  
RatingInsertResponse !
>! "
RateScreenplayAsync# 6
(6 7
RatingInsertRequest7 J
requestK R
)R S
;S T
} 
} ∫	
áC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Repositories\IReportRepository.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Repositories )
{		 
public

 

	interface

 
IReportRepository

 &
{ 
Task 
< 
IReadOnlyList 
< !
MostRatedMoviesReport 0
>0 1
>1 2#
GetMostRatedMoviesAsync3 J
(J K
)K L
;L M
Task 
< 
IReadOnlyList 
< ,
 MostViewedMoviesForAPeriodReport ;
>; <
>< =.
"GetMostViewedMoviesForAPeriodAsync> `
(` a
DateTimea i
	startDatej s
,s t
DateTimeu }
endDate	~ Ö
)
Ö Ü
;
Ü á
Task 
< 
IReadOnlyList 
< -
!MostSoldMoviesWithoutRatingReport <
>< =
>= >/
#GetMostSoldMoviesWithoutRatingAsync? b
(b c
)c d
;d e
} 
} ◊
ãC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Repositories\IScreenplayRepository.cs
	namespace

 	
ScreenplayApp


 
.

 
Core

 
.

 
Repositories

 )
{ 
public 

	interface !
IScreenplayRepository *
{ 
Task 
< 
	PagedList 
< 
ScreenplayResponse )
>) *
>* +
GetScreenplaysAsync, ?
(? @!
ScreenplaysGetRequest@ U
requestV ]
)] ^
;^ _
Task 
< 
ScreenplayResponse 
>  
GetScreenplayAsync! 3
(3 4
int4 7
id8 :
): ;
;; <
} 
} ˛
áC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Repositories\ITicketRepository.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Repositories		 )
{

 
public 

	interface 
ITicketRepository &
{ 
public 
Task 
< 
IEnumerable 
<  
TicketResponse  .
>. /
>/ 0
GetTicketsAsync1 @
(@ A
TicketsGetRequestA R
requestS Z
)Z [
;[ \
public 
Task 
< 
TicketResponse "
>" #
UpdateTicketsAsync$ 6
(6 7
UpdateTicketRequest7 J
requestK R
)R S
;S T
} 
} Ü
ÅC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Services\IAccountService.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Services		 %
{

 
public 

	interface 
IAccountService $
{ 
Task 
< 
AccountResponse 
> 
Register &
(& '"
RegisterAccountRequest' =
request> E
)E F
;F G
Task 
< 
AccountResponse 
> 
Login #
(# $
LoginAccountRequest$ 7
request8 ?
)? @
;@ A
} 
} À
ÅC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Services\IBookingService.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Services		 %
{

 
public 

	interface 
IBookingService $
{ 
Task 
< 
BookingResponse 
> 
CreateBookingAsync 0
(0 1 
BookingInsertRequest1 E
requestF M
)M N
;N O
} 
} ¸
ÄC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Services\ILoggerManager.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Services %
{ 
public		 

	interface		 
ILoggerManager		 #
{

 
void 
LogInformation 
( 
string "
message# *
)* +
;+ ,
} 
} …
ÄC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Services\IRatingService.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Services		 %
{

 
public 

	interface 
IRatingService #
{ 
Task 
<  
RatingInsertResponse !
>! "
RateScreenplay# 1
(1 2
RatingInsertRequest2 E
requestF M
)M N
;N O
} 
} Ç	
ÄC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Services\IReportService.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Services		 %
{

 
public 

	interface 
IReportService #
{ 
Task 
< 
IReadOnlyList 
< !
MostRatedMoviesReport 0
>0 1
>1 2#
GetMostRatedMoviesAsync3 J
(J K
)K L
;L M
Task 
< 
IReadOnlyList 
< ,
 MostViewedMoviesForAPeriodReport ;
>; <
>< =.
"GetMostViewedMoviesForAPeriodAsync> `
(` a&
MostViewedMoviesGetRequesta {
request	| É
)
É Ñ
;
Ñ Ö
Task 
< 
IReadOnlyList 
< -
!MostSoldMoviesWithoutRatingReport <
>< =
>= >/
#GetMostSoldMoviesWithoutRatingAsync? b
(b c
)c d
;d e
} 
} …
ÑC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Services\IScreenplayService.cs
	namespace

 	
ScreenplayApp


 
.

 
Core

 
.

 
Services

 %
{ 
public 

	interface 
IScreenplayService '
{ 
Task 
< 
	PagedList 
< 
ScreenplayResponse )
>) *
>* +
GetScreenplaysAsync, ?
(? @!
ScreenplaysGetRequest@ U
requestV ]
)] ^
;^ _
Task 
< 
ScreenplayResponse 
>  
GetScreenplayAsync! 3
(3 4
int4 7
id8 :
): ;
;; <
} 
} 
ÄC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Services\ITicketService.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 
Services		 %
{

 
public 

	interface 
ITicketService #
{ 
public 
Task 
< 
IEnumerable 
<  
TicketResponse  .
>. /
>/ 0
GetTicketsAsync1 @
(@ A
TicketsGetRequestA R
requestS Z
)Z [
;[ \
public 
Task 
< 
TicketResponse "
>" #
UpdateTicketsAsync$ 6
(6 7
UpdateTicketRequest7 J
requestK R
)R S
;S T
} 
} ¶
C:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Services\ITokenService.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Services %
{		 
public

 

	interface

 
ITokenService

 "
{ 
Task 
< 
string 
> 
CreateToken  
(  !
AppUser! (
user) -
)- .
;. /
} 
} ª
ëC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Validators\BookingInsertRequestValidator.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 

Validators		 '
{

 
public 

class )
BookingInsertRequestValidator .
:/ 0
AbstractValidator1 B
<B C 
BookingInsertRequestC W
>W X
{ 
public )
BookingInsertRequestValidator ,
(, -
)- .
{ 	
RuleFor 
( 
x 
=> 
x 
. 
	AppUserId $
)$ %
. 
Null 
( 
) 
; 
RuleFor 
( 
x 
=> 
x 
. 
Location #
)# $
. 
NotEmpty 
( 
) 
; 
RuleFor 
( 
x 
=> 
x 
. 
Date 
)  
. 
NotEmpty 
( 
) 
; 
RuleFor 
( 
x 
=> 
x 
. 
ScreenplayId '
)' (
. 
NotEmpty 
( 
) 
; 
RuleFor 
( 
x 
=> 
x 
. 
NumberOfTickets *
)* +
. 
NotEmpty 
( 
) 
; 
} 	
} 
} ë
êC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Validators\LoginAccountRequestValidator.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 

Validators		 '
{

 
public 

class (
LoginAccountRequestValidator -
:. /
AbstractValidator0 A
<A B
LoginAccountRequestB U
>U V
{ 
public (
LoginAccountRequestValidator +
(+ ,
), -
{ 	
RuleFor 
( 
x 
=> 
x 
. 
UserName #
)# $
. 
NotNull 
( 
) 
. 
MaximumLength 
( 
$num !
)! "
. 
MinimumLength 
( 
$num  
)  !
;! "
RuleFor 
( 
x 
=> 
x 
. 
Password #
)# $
. 
NotNull 
( 
) 
. 
MaximumLength 
( 
$num !
)! "
. 
MinimumLength 
( 
$num  
)  !
;! "
} 	
} 
} ﬂ	
óC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Validators\MostViewedMoviesGetRequestValidator.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 

Validators		 '
{

 
public 

class /
#MostViewedMoviesGetRequestValidator 4
:5 6
AbstractValidator7 H
<H I&
MostViewedMoviesGetRequestI c
>c d
{ 
public /
#MostViewedMoviesGetRequestValidator 2
(2 3
)3 4
{ 	
RuleFor 
( 
x 
=> 
x 
. 
	StartDate $
)$ %
. 
NotNull 
( 
) 
; 
RuleFor 
( 
x 
=> 
x 
. 
EndDate "
)" #
. 
NotNull 
( 
) 
. 
GreaterThan 
( 
x 
=> !
x" #
.# $
	StartDate$ -
)- .
;. /
} 	
} 
} Æ

êC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Validators\RatingInsertRequestValidator.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 

Validators		 '
{

 
public 

class (
RatingInsertRequestValidator -
:. /
AbstractValidator0 A
<A B
RatingInsertRequestB U
>U V
{ 
public (
RatingInsertRequestValidator +
(+ ,
), -
{ 	
RuleFor 
( 
x 
=> 
x 
. 
Rate 
)  
. 
NotNull 
( 
) 
. 
GreaterThan 
( 
$num 
) 
. 
LessThan 
( 
$num 
) 
; 
RuleFor 
( 
x 
=> 
x 
. 
ScreenplayId '
)' (
. 
NotNull 
( 
) 
. 
GreaterThan 
( 
$num 
) 
;  
} 	
} 
} ∞
ìC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Core\Validators\RegisterAccountRequestValidator.cs
	namespace		 	
ScreenplayApp		
 
.		 
Core		 
.		 

Validators		 '
{

 
public 

class +
RegisterAccountRequestValidator 0
:1 2
AbstractValidator3 D
<D E"
RegisterAccountRequestE [
>[ \
{ 
public +
RegisterAccountRequestValidator .
(. /
)/ 0
{ 	
RuleFor 
( 
x 
=> 
x 
. 
UserName #
)# $
. 
NotNull 
( 
) 
. 
MaximumLength 
( 
$num !
)! "
. 
MinimumLength 
( 
$num  
)  !
;! "
RuleFor 
( 
x 
=> 
x 
. 
	FirstName $
)$ %
. 
MaximumLength 
( 
$num "
)" #
. 
MinimumLength 
( 
$num  
)  !
;! "
RuleFor 
( 
x 
=> 
x 
. 
LastName #
)# $
. 
MaximumLength 
( 
$num "
)" #
. 
MinimumLength 
( 
$num  
)  !
;! "
RuleFor 
( 
x 
=> 
x 
. 
Password #
)# $
. 
NotNull 
( 
) 
. 
MaximumLength 
( 
$num !
)! "
. 
MinimumLength 
( 
$num  
)  !
;! "
}   	
}!! 
}"" 