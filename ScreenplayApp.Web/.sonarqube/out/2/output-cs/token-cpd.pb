À
ÖC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Controllers\AccountController.cs
	namespace 	
ScreenplayApp
 
. 
Web 
. 
Controllers '
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
AccountController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IAccountService (
_accountService) 8
;8 9
public 
AccountController  
(  !
IAccountService! 0
accountService1 ?
)? @
{ 	
_accountService 
= 
accountService ,
;, -
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
AccountResponse' 6
>6 7
>7 8
Register9 A
(A B"
RegisterAccountRequestB X
requestY `
)` a
{ 	
var 
response 
= 
await  
_accountService! 0
.0 1
Register1 9
(9 :
request: A
)A B
;B C
return 
Ok 
( 
response 
) 
;  
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public   
async   
Task   
<   
ActionResult   &
<  & '
AccountResponse  ' 6
>  6 7
>  7 8
Login  9 >
(  > ?
LoginAccountRequest  ? R
request  S Z
)  Z [
{!! 	
var"" 
response"" 
="" 
await""  
_accountService""! 0
.""0 1
Login""1 6
(""6 7
request""7 >
)""> ?
;""? @
return## 
Ok## 
(## 
response## 
)## 
;##  
}$$ 	
}%% 
}&& ∆
ÜC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Controllers\BookingsController.cs
	namespace 	
ScreenplayApp
 
. 
Web 
. 
Controllers '
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
BookingsController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IBookingService (
_bookingService) 8
;8 9
public 
BookingsController !
(! "
IBookingService" 1
bookingService2 @
)@ A
{ 	
_bookingService 
= 
bookingService ,
;, -
} 	
[ 	
	Authorize	 
] 
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
BookingResponse' 6
>6 7
>7 8

AddBooking9 C
(C D 
BookingInsertRequestD X
requestY `
)` a
{ 	
request 
. 
	AppUserId 
= 
User  $
.$ %
	GetUserId% .
(. /
)/ 0
;0 1
var 
response 
= 
await  
_bookingService! 0
.0 1
CreateBookingAsync1 C
(C D
requestD K
)K L
;L M
return 
Ok 
( 
response 
) 
;  
}   	
}!! 
}"" ◊
ÖC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Controllers\RatingsController.cs
	namespace 	
ScreenplayApp
 
. 
Web 
. 
Controllers '
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
RatingsController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IRatingService '
_ratingService( 6
;6 7
public 
RatingsController  
(  !
IRatingService! /
ratingService0 =
)= >
{ 	
_ratingService 
= 
ratingService *
;* +
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
<& ' 
RatingInsertResponse' ;
>; <
>< =
	AddRating> G
(G H
RatingInsertRequestH [
request\ c
)c d
{ 	
var 
response 
= 
await  
_ratingService! /
./ 0
RateScreenplay0 >
(> ?
request? F
)F G
;G H
return 
Ok 
( 
response 
) 
;  
} 	
} 
} ä
ÖC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Controllers\ReportsController.cs
	namespace 	
ScreenplayApp
 
. 
Web 
. 
Controllers '
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
ReportsController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IReportService '
_reportService( 6
;6 7
public 
ReportsController  
(  !
IReportService! /
reportService0 =
)= >
{ 	
_reportService 
= 
reportService *
;* +
} 	
[ 	
HttpGet	 
( 
$str $
)$ %
]% &
public 
async 
Task 
< 
ActionResult &
<& '
IReadOnlyList' 4
<4 5!
MostRatedMoviesReport5 J
>J K
>K L
>L M
GetMostRatedMoviesN `
(` a
)a b
{ 	
var 
response 
= 
await  
_reportService! /
./ 0#
GetMostRatedMoviesAsync0 G
(G H
)H I
;I J
return 
Ok 
( 
response 
) 
;  
} 	
[ 	
HttpGet	 
( 
$str 2
)2 3
]3 4
public   
async   
Task   
<   
ActionResult   &
<  & '
IReadOnlyList  ' 4
<  4 5-
!MostSoldMoviesWithoutRatingReport  5 V
>  V W
>  W X
>  X Y*
GetMostSoldMoviesWithoutRating  Z x
(  x y
)  y z
{!! 	
var"" 
response"" 
="" 
await""  
_reportService""! /
.""/ 0/
#GetMostSoldMoviesWithoutRatingAsync""0 S
(""S T
)""T U
;""U V
return## 
Ok## 
(## 
response## 
)## 
;##  
}$$ 	
[&& 	
HttpGet&&	 
(&& 
$str&& 1
)&&1 2
]&&2 3
public'' 
async'' 
Task'' 
<'' 
ActionResult'' &
<''& '
IReadOnlyList''' 4
<''4 5,
 MostViewedMoviesForAPeriodReport''5 U
>''U V
>''V W
>''W X)
GetMostViewedMoviesForAPeriod''Y v
(''v w
[''w x
	FromQuery	''x Å
]
''Å Ç(
MostViewedMoviesGetRequest
''É ù
request
''û •
)
''• ¶
{(( 	
var)) 
response)) 
=)) 
await))  
_reportService))! /
.))/ 0.
"GetMostViewedMoviesForAPeriodAsync))0 R
())R S
request))S Z
)))Z [
;))[ \
return** 
Ok** 
(** 
response** 
)** 
;**  
}++ 	
},, 
}-- ⁄
âC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Controllers\ScreenplaysController.cs
	namespace 	
ScreenplayApp
 
. 
Web 
. 
Controllers '
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class !
ScreenplaysController &
:' (
ControllerBase) 7
{ 
private 
readonly 
IScreenplayService +
_screenplayService, >
;> ?
private 
readonly 
IElasticClient '
_elasticClient( 6
;6 7
public !
ScreenplaysController $
($ %
IScreenplayService% 7
screenplayService8 I
,I J
IElasticClientK Y
elasticClientZ g
)g h
{ 	
_screenplayService 
=  
screenplayService! 2
;2 3
_elasticClient 
= 
elasticClient *
;* +
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
	PagedList' 0
<0 1
ScreenplayResponse1 C
>C D
>D E
>E F
GetScreenplaysG U
(U V
[V W
	FromQueryW `
]` a!
ScreenplaysGetRequestb w
screenplayParams	x à
)
à â
{ 	
var 
response 
= 
await  
_screenplayService! 3
.3 4
GetScreenplaysAsync4 G
(G H
screenplayParamsH X
)X Y
;Y Z
return   
Ok   
(   
response   
)   
;    
}!! 	
[## 	
HttpGet##	 
(## 
$str## 
)## 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
ActionResult$$ &
<$$& '
ScreenplayResponse$$' 9
>$$9 :
>$$: ;
GetScreenplay$$< I
($$I J
int$$J M
id$$N P
)$$P Q
{%% 	
var&& 
response&& 
=&& 
await&&  
_screenplayService&&! 3
.&&3 4
GetScreenplayAsync&&4 F
(&&F G
id&&G I
)&&I J
;&&J K
return'' 
Ok'' 
('' 
response'' 
)'' 
;''  
}(( 	
})) 
}** ˝1
èC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Extensions\ApplicationServiceExtensions.cs
	namespace 	
ScreenplayApp
 
. 
Web 
. 

Extensions &
{ 
public 

static 
class (
ApplicationServiceExtensions 4
{ 
public 
static 
IServiceCollection ("
AddApplicationServices) ?
(? @
this@ D
IServiceCollectionE W
servicesX `
,` a
IConfigurationb p
configurationq ~
)~ 
{ 	
services 
. 
AddSingleton !
<! "
ILoggerManager" 0
,0 1
LoggerManager2 ?
>? @
(@ A
)A B
;B C
services 
. 
	AddScoped 
< 
IAccountService .
,. /
AccountService0 >
>> ?
(? @
)@ A
;A B
services 
. 
	AddScoped 
< 
ITokenService ,
,, -
TokenService. :
>: ;
(; <
)< =
;= >
services 
. 
	AddScoped 
< 
IScreenplayService 1
,1 2
ScreenplayService3 D
>D E
(E F
)F G
;G H
services 
. 
	AddScoped 
< 
IRatingService -
,- .
RatingService/ <
>< =
(= >
)> ?
;? @
services   
.   
	AddScoped   
<   
ITicketService   -
,  - .
TicketService  / <
>  < =
(  = >
)  > ?
;  ? @
services!! 
.!! 
	AddScoped!! 
<!! 
IBookingService!! .
,!!. /
BookingService!!0 >
>!!> ?
(!!? @
)!!@ A
;!!A B
services"" 
."" 
	AddScoped"" 
<"" 
IReportService"" -
,""- .
ReportService""/ <
>""< =
(""= >
)""> ?
;""? @
services%% 
.%% 
	AddScoped%% 
<%% 
IRatingRepository%% 0
,%%0 1
RatingRepository%%2 B
>%%B C
(%%C D
)%%D E
;%%E F
services&& 
.&& 
	AddScoped&& 
<&& !
IScreenplayRepository&& 4
,&&4 5 
ScreenplayRepository&&6 J
>&&J K
(&&K L
)&&L M
;&&M N
services'' 
.'' 
	AddScoped'' 
<'' 
ITicketRepository'' 0
,''0 1
TicketRepository''2 B
>''B C
(''C D
)''D E
;''E F
services(( 
.(( 
	AddScoped(( 
<(( 
IBookingRepository(( 1
,((1 2
BookingRepository((3 D
>((D E
(((E F
)((F G
;((G H
services)) 
.)) 
	AddScoped)) 
<)) 
IReportRepository)) 0
,))0 1
ReportRepository))2 B
>))B C
())C D
)))D E
;))E F
services,, 
.,, 
AddAutoMapper,, "
(,," #
typeof,,# )
(,,) *
AutoMapperProfiles,,* <
),,< =
.,,= >
Assembly,,> F
),,F G
;,,G H
services.. 
... 
AddDbContext.. !
<..! "
DataContext.." -
>..- .
(... /
options../ 6
=>..7 9
{// 
options00 
.00 
UseSqlServer00 $
(00$ %
configuration00% 2
.002 3
GetConnectionString003 F
(00F G
$str00G Z
)00Z [
)00[ \
;00\ ]
}11 
)11 
;11 
services44 
.44 
AddMvc44 
(44 
)44 
.55 
AddFluentValidation55 $
(55$ %
)55% &
.66 
AddJsonOptions66 
(66  
options66  '
=>66( *
{77 
options88 
.88  !
JsonSerializerOptions88  5
.885 6

Converters886 @
.88@ A
Add88A D
(88D E
new88E H#
JsonStringEnumConverter88I `
(88` a
)88a b
)88b c
;88c d
options99 
.99  !
JsonSerializerOptions99  5
.995 6
IgnoreNullValues996 F
=99G H
true99I M
;99M N
}:: 
):: 
;:: 
;:: 
services;; 
.;; 
AddTransient;; !
<;;! "

IValidator;;" ,
<;;, -"
RegisterAccountRequest;;- C
>;;C D
,;;D E+
RegisterAccountRequestValidator;;F e
>;;e f
(;;f g
);;g h
;;;h i
services<< 
.<< 
AddTransient<< !
<<<! "

IValidator<<" ,
<<<, -
LoginAccountRequest<<- @
><<@ A
,<<A B(
LoginAccountRequestValidator<<C _
><<_ `
(<<` a
)<<a b
;<<b c
services== 
.== 
AddTransient== !
<==! "

IValidator==" ,
<==, - 
BookingInsertRequest==- A
>==A B
,==B C)
BookingInsertRequestValidator==D a
>==a b
(==b c
)==c d
;==d e
services>> 
.>> 
AddTransient>> !
<>>! "

IValidator>>" ,
<>>, -
RatingInsertRequest>>- @
>>>@ A
,>>A B(
RatingInsertRequestValidator>>C _
>>>_ `
(>>` a
)>>a b
;>>b c
services?? 
.?? 
AddTransient?? !
<??! "

IValidator??" ,
<??, -&
MostViewedMoviesGetRequest??- G
>??G H
,??H I/
#MostViewedMoviesGetRequestValidator??J m
>??m n
(??n o
)??o p
;??p q
returnAA 
servicesAA 
;AA 
}BB 	
}CC 
}DD ‡

åC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Extensions\ClaimsPrincipleExtentions.cs
	namespace 	
ScreenplayApp
 
. 
Web 
. 

Extensions &
{ 
public		 

static		 
class		 %
ClaimsPrincipleExtentions		 1
{

 
public 
static 
string 
GetUsername (
(( )
this) -
ClaimsPrincipal. =
user> B
)B C
{ 	
return 
user 
. 
	FindFirst !
(! "

ClaimTypes" ,
., -
Name- 1
)1 2
?2 3
.3 4
Value4 9
;9 :
} 	
public 
static 
int 
	GetUserId #
(# $
this$ (
ClaimsPrincipal) 8
user9 =
)= >
{ 	
return 
int 
. 
Parse 
( 
user !
.! "
	FindFirst" +
(+ ,

ClaimTypes, 6
.6 7
NameIdentifier7 E
)E F
?F G
.G H
ValueH M
)M N
;N O
} 	
} 
} ˇ
äC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Extensions\ElasticsearchExtensions.cs
	namespace

 	
ScreenplayApp


 
.

 
Web

 
.

 

Extensions

 &
{ 
public 

static 
class #
ElasticsearchExtensions /
{ 
public 
static 
void 
AddElasticsearch +
(+ ,
this 
IServiceCollection #
services$ ,
,, -
IConfiguration. <
configuration= J
)J K
{ 	
var 
url 
= 
configuration #
[# $
$str$ 7
]7 8
;8 9
var 
defaultIndex 
= 
configuration ,
[, -
$str- B
]B C
;C D
var 
settings 
= 
new 
ConnectionSettings 1
(1 2
new2 5
Uri6 9
(9 :
url: =
)= >
)> ?
. 
DefaultIndex 
( 
defaultIndex *
)* +
. 
DefaultMappingFor "
<" #!
MostRatedMoviesReport# 8
>8 9
(9 :
r: ;
=>< >
r? @
. 
PropertyName !
(! "
r" #
=>$ &
r' (
.( )
number_of_ratings) :
,: ;
$str< M
)M N
) 
; 
var 
client 
= 
new 
ElasticClient *
(* +
settings+ 3
)3 4
;4 5
services 
. 
AddSingleton !
<! "
IElasticClient" 0
>0 1
(1 2
client2 8
)8 9
;9 :
} 	
} 
} ´
åC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Extensions\IdentityServiceExtensions.cs
	namespace 	
ScreenplayApp
 
. 
Web 
. 

Extensions &
{ 
public 

static 
class %
IdentityServiceExtensions 1
{ 
public 
static 
IServiceCollection (
AddIdentityServices) <
(< =
this= A
IServiceCollectionB T
servicesU ]
,] ^
IConfiguration_ m
configurationn {
){ |
{ 	
services 
. 
AddIdentityCore $
<$ %
AppUser% ,
>, -
(- .
opt. 1
=>2 4
{5 6
opt 
. 
Password 
. "
RequireNonAlphanumeric 3
=4 5
false6 ;
;; <
} 
) 
. 
AddRoles 
< 
AppRole !
>! "
(" #
)# $
. 
AddRoleManager 
<  
RoleManager  +
<+ ,
AppRole, 3
>3 4
>4 5
(5 6
)6 7
. 
AddSignInManager !
<! "
SignInManager" /
</ 0
AppUser0 7
>7 8
>8 9
(9 :
): ;
. 
AddRoleValidator !
<! "
RoleValidator" /
</ 0
AppRole0 7
>7 8
>8 9
(9 :
): ;
. $
AddEntityFrameworkStores )
<) *
DataContext* 5
>5 6
(6 7
)7 8
;8 9
services 
. 
AddAuthentication &
(& '
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
. 
AddJwtBearer 
( 
options %
=>& (
{ 
options   
.   %
TokenValidationParameters   5
=  6 7
new  8 ;%
TokenValidationParameters  < U
{!! $
ValidateIssuerSigningKey"" 0
=""1 2
true""3 7
,""7 8
IssuerSigningKey## (
=##) *
new##+ . 
SymmetricSecurityKey##/ C
(##C D
Encoding##D L
.##L M
UTF8##M Q
.##Q R
GetBytes##R Z
(##Z [
configuration##[ h
[##h i
$str##i s
]##s t
)##t u
)##u v
,##v w
ValidateIssuer$$ &
=$$' (
false$$) .
,$$. /
ValidateAudience%% (
=%%) *
false%%+ 0
}&& 
;&& 
}'' 
)'' 
;'' 
services)) 
.)) 
AddAuthorization)) %
())% &
opt))& )
=>))* ,
{** 
opt++ 
.++ 
	AddPolicy++ 
(++ 
$str++ 3
,++3 4
policy++5 ;
=>++< >
policy++? E
.++E F
RequireRole++F Q
(++Q R
$str++R \
)++\ ]
)++] ^
;++^ _
},, 
),, 
;,, 
return.. 
services.. 
;.. 
}// 	
}00 
}11 Ë
uC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\LoggerManager.cs
	namespace 	
ScreenplayApp
 
. 
Web 
{ 
public 

class 
LoggerManager 
:  
ILoggerManager! /
{ 
private 
readonly 
ILog 
_logger %
=& '

LogManager( 2
.2 3
	GetLogger3 <
(< =
typeof= C
(C D
LoggerManagerD Q
)Q R
)R S
;S T
public 
LoggerManager 
( 
) 
{ 	
try 
{ 
XmlDocument 
log4netConfig )
=* +
new, /
XmlDocument0 ;
(; <
)< =
;= >
using 
( 
var 
fs 
= 
File  $
.$ %
OpenRead% -
(- .
$str. >
)> ?
)? @
{ 
log4netConfig !
.! "
Load" &
(& '
fs' )
)) *
;* +
var 
repo 
= 

LogManager )
.) *
CreateRepository* :
(: ;
Assembly; C
.C D
GetEntryAssemblyD T
(T U
)U V
,V W
typeofX ^
(^ _
log4net_ f
.f g

Repositoryg q
.q r
	Hierarchyr {
.{ |
	Hierarchy	| Ö
)
Ö Ü
)
Ü á
;
á à
XmlConfigurator #
.# $
	Configure$ -
(- .
repo. 2
,2 3
log4netConfig4 A
[A B
$strB K
]K L
)L M
;M N
_logger 
. 
Info  
(  !
$str! 9
)9 :
;: ;
} 
} 
catch   
(   
	Exception   
ex   
)    
{!! 
_logger"" 
."" 
Error"" 
("" 
$str"" %
,""% &
ex""' )
)"") *
;""* +
}## 
}$$ 	
public%% 
void%% 
LogInformation%% "
(%%" #
string%%# )
message%%* 1
)%%1 2
{&& 	
_logger'' 
.'' 
Info'' 
('' 
message''  
)''  !
;''! "
}(( 	
})) 
}** ”
ÅC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Mapper\AutoMapperProfiles.cs
	namespace 	
ScreenplayApp
 
. 
Core 
. 
Mapper #
{ 
public 

class 
AutoMapperProfiles #
:$ %
Profile& -
{ 
public 
AutoMapperProfiles !
(! "
)" #
{ 	
	CreateMap 
< "
RegisterAccountRequest ,
,, -
AppUser. 5
>5 6
(6 7
)7 8
.8 9

ReverseMap9 C
(C D
)D E
;E F
	CreateMap 
< 

Screenplay  
,  !
ScreenplayResponse" 4
>4 5
(5 6
)6 7
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
AverageRate( 3
,3 4
opt5 8
=>9 ;
opt< ?
.? @
MapFrom@ G
(G H
srcH K
=>L N
srcO R
.R S
RatingsS Z
.Z [
Average[ b
(b c
rc d
=>e g
rh i
.i j
Ratej n
)n o
)o p
)p q
. 

ReverseMap 
( 
) 
; 
	CreateMap 
< 
Actor 
, 
ActorResponse *
>* +
(+ ,
), -
.- .

ReverseMap. 8
(8 9
)9 :
;: ;
	CreateMap 
< 
RatingInsertRequest )
,) *
Rating+ 1
>1 2
(2 3
)3 4
.4 5

ReverseMap5 ?
(? @
)@ A
;A B
	CreateMap 
<  
RatingInsertResponse *
,* +
Rating, 2
>2 3
(3 4
)4 5
.5 6

ReverseMap6 @
(@ A
)A B
;B C
	CreateMap 
< 
TicketResponse $
,$ %
Ticket& ,
>, -
(- .
). /
./ 0

ReverseMap0 :
(: ;
); <
;< =
	CreateMap 
< 
UpdateTicketRequest )
,) *
Ticket+ 1
>1 2
(2 3
)3 4
.4 5

ReverseMap5 ?
(? @
)@ A
;A B
	CreateMap 
<  
BookingInsertRequest *
,* +
Booking, 3
>3 4
(4 5
)5 6
.6 7

ReverseMap7 A
(A B
)B C
;C D
	CreateMap   
<   
BookingResponse   %
,  % &
Booking  ' .
>  . /
(  / 0
)  0 1
.  1 2

ReverseMap  2 <
(  < =
)  = >
;  > ?
}!! 	
}"" 
}## ∞)
áC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Middlewares\ExceptionMiddleware.cs
	namespace 	
ScreenplayApp
 
. 
Web 
. 
Middlewares '
{ 
public 

class 
ExceptionMiddleware $
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
readonly 
ILogger  
<  !
ExceptionMiddleware! 4
>4 5
_logger6 =
;= >
private 
readonly 
IHostEnvironment )
_env* .
;. /
private 
readonly 
ILoggerManager '
_loggerManager( 6
;6 7
public 
ExceptionMiddleware "
(" #
RequestDelegate# 2
next3 7
,7 8
ILogger9 @
<@ A
ExceptionMiddlewareA T
>T U
loggerV \
,\ ]
IHostEnvironment 
env  
,  !
ILoggerManager" 0
loggerManager1 >
)> ?
{ 	
_next 
= 
next 
; 
_logger 
= 
logger 
; 
_loggerManager 
= 
loggerManager *
;* +
_env 
= 
env 
; 
} 	
public   
async   
Task   
InvokeAsync   %
(  % &
HttpContext  & 1
context  2 9
)  9 :
{!! 	
try"" 
{## 
await$$ 
_next$$ 
($$ 
context$$ #
)$$# $
;$$$ %
}%% 
catch&& 
(&& 
	Exception&& 
ex&& 
)&&  
{'' 
_loggerManager(( 
.(( 
LogInformation(( -
(((- .
ex((. 0
.((0 1
Message((1 8
)((8 9
;((9 :
_logger)) 
.)) 
LogError))  
())  !
ex))! #
,))# $
ex))% '
.))' (
Message))( /
)))/ 0
;))0 1
var** 
response** 
=** 
context** &
.**& '
Response**' /
;**/ 0
response++ 
.++ 
ContentType++ $
=++% &
$str++' 9
;++9 :
switch-- 
(-- 
ex-- 
)-- 
{.. 
case// 
BadRequestException// ,
e//- .
://. /
response00  
.00  !

StatusCode00! +
=00, -
(00. /
int00/ 2
)002 3
HttpStatusCode003 A
.00A B

BadRequest00B L
;00L M
break11 
;11 
case22 $
ForbiddenAccessException22 1
e222 3
:223 4
response33  
.33  !

StatusCode33! +
=33, -
(33. /
int33/ 2
)332 3
HttpStatusCode333 A
.33A B
	Forbidden33B K
;33K L
break44 
;44 
case55 
NotFoundException55 *
e55+ ,
:55, -
response66  
.66  !

StatusCode66! +
=66, -
(66. /
int66/ 2
)662 3
HttpStatusCode663 A
.66A B
NotFound66B J
;66J K
break77 
;77 
default88 
:88 
response99  
.99  !

StatusCode99! +
=99, -
(99. /
int99/ 2
)992 3
HttpStatusCode993 A
.99A B
InternalServerError99B U
;99U V
break:: 
;:: 
};; 
var== 
result== 
=== 
_env== !
.==! "
IsDevelopment==" /
(==/ 0
)==0 1
?>> 
new>> 
ApiException>> &
(>>& '
response>>' /
.>>/ 0

StatusCode>>0 :
,>>: ;
ex>>< >
.>>> ?
Message>>? F
,>>F G
ex>>H J
.>>J K

StackTrace>>K U
?>>U V
.>>V W
ToString>>W _
(>>_ `
)>>` a
)>>a b
:?? 
new?? 
ApiException?? &
(??& '
response??' /
.??/ 0

StatusCode??0 :
,??: ;
$str??< S
)??S T
;??T U
varAA 
optionsAA 
=AA 
newAA !!
JsonSerializerOptionsAA" 7
{AA8 9 
PropertyNamingPolicyAA: N
=AAO P
JsonNamingPolicyAAQ a
.AAa b
	CamelCaseAAb k
}AAl m
;AAm n
varBB 
jsonBB 
=BB 
JsonSerializerBB )
.BB) *
	SerializeBB* 3
(BB3 4
resultBB4 :
,BB: ;
optionsBB< C
)BBC D
;BBD E
awaitDD 
responseDD 
.DD 

WriteAsyncDD )
(DD) *
jsonDD* .
)DD. /
;DD/ 0
}EE 
}FF 	
}GG 
}HH ˝
oC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Program.cs
	namespace 	
ScreenplayApp
 
. 
Web 
{ 
public 

class 
Program 
{ 
public 
static 
async 
Task  
Main! %
(% &
string& ,
[, -
]- .
args/ 3
)3 4
{ 	
var 
host 
= 
CreateHostBuilder (
(( )
args) -
)- .
.. /
Build/ 4
(4 5
)5 6
;6 7
using 
var 
scope 
= 
host "
." #
Services# +
.+ ,
CreateScope, 7
(7 8
)8 9
;9 :
var 
services 
= 
scope  
.  !
ServiceProvider! 0
;0 1
try 
{ 
var 
context 
= 
services &
.& '
GetRequiredService' 9
<9 :
DataContext: E
>E F
(F G
)G H
;H I
var 
userManager 
=  !
services" *
.* +
GetRequiredService+ =
<= >
UserManager> I
<I J
AppUserJ Q
>Q R
>R S
(S T
)T U
;U V
var 
roleManager 
=  !
services" *
.* +
GetRequiredService+ =
<= >
RoleManager> I
<I J
AppRoleJ Q
>Q R
>R S
(S T
)T U
;U V
await   
context   
.   
Database   &
.  & '
MigrateAsync  ' 3
(  3 4
)  4 5
;  5 6
await!! 
Seed!! 
.!! 
	SeedUsers!! $
(!!$ %
userManager!!% 0
,!!0 1
roleManager!!2 =
)!!= >
;!!> ?
await"" 
Seed"" 
."" 
SeedScreenplays"" *
(""* +
context""+ 2
)""2 3
;""3 4
}## 
catch$$ 
($$ 
	Exception$$ 
ex$$ 
)$$  
{%% 
var&& 
logger&& 
=&& 
services&& %
.&&% &
GetRequiredService&&& 8
<&&8 9
ILogger&&9 @
<&&@ A
Program&&A H
>&&H I
>&&I J
(&&J K
)&&K L
;&&L M
logger'' 
.'' 
LogError'' 
(''  
ex''  "
,''" #
$str''$ H
)''H I
;''I J
}(( 
await** 
host** 
.** 
RunAsync** 
(**  
)**  !
;**! "
}++ 	
public-- 
static-- 
IHostBuilder-- "
CreateHostBuilder--# 4
(--4 5
string--5 ;
[--; <
]--< =
args--> B
)--B C
=>--D F
Host.. 
...  
CreateDefaultBuilder.. %
(..% &
args..& *
)..* +
.// $
ConfigureWebHostDefaults// )
(//) *

webBuilder//* 4
=>//5 7
{00 

webBuilder11 
.11 

UseStartup11 )
<11) *
Startup11* 1
>111 2
(112 3
)113 4
;114 5
}22 
)22 
;22 
}33 
}44 Ú%
oC:\Users\mirzace\Desktop\Projects\Junior Acceleration Program\JAP_Task1_v2\BackEnd\ScreenplayApp.Web\Startup.cs
	namespace 	
ScreenplayApp
 
. 
Web 
{ 
public 

class 
Startup 
{ 
public 
readonly 
IConfiguration &
_configuration' 5
;5 6
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
_configuration 
= 
configuration *
;* +
} 	
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services!! 
.!! 
AddControllers!! #
(!!# $
)!!$ %
;!!% &
services"" 
."" 
AddSwaggerGen"" "
(""" #
c""# $
=>""% '
{## 
c$$ 
.$$ 

SwaggerDoc$$ 
($$ 
$str$$ !
,$$! "
new$$# &
OpenApiInfo$$' 2
{$$3 4
Title$$5 :
=$$; <
$str$$= P
,$$P Q
Version$$R Y
=$$Z [
$str$$\ `
}$$a b
)$$b c
;$$c d
c%% 
.%% !
AddSecurityDefinition%% '
(%%' (
$str%%( 0
,%%0 1
new%%2 5!
OpenApiSecurityScheme%%6 K
{&& 
Description'' 
=''  !
$str''" v
,''v w
In(( 
=(( 
ParameterLocation(( *
.((* +
Header((+ 1
,((1 2
Name)) 
=)) 
$str)) *
,))* +
Type** 
=** 
SecuritySchemeType** -
.**- .
ApiKey**. 4
}++ 
)++ 
;++ 
c,, 
.,, 
OperationFilter,, !
<,,! "/
#SecurityRequirementsOperationFilter,," E
>,,E F
(,,F G
),,G H
;,,H I
}-- 
)-- 
;-- 
services// 
.// "
AddApplicationServices// +
(//+ ,
_configuration//, :
)//: ;
;//; <
services00 
.00 
AddIdentityServices00 (
(00( )
_configuration00) 7
)007 8
;008 9
services11 
.11 
AddElasticsearch11 %
(11% &
_configuration11& 4
)114 5
;115 6
}22 	
public55 
void55 
	Configure55 
(55 
IApplicationBuilder55 1
app552 5
,555 6
IWebHostEnvironment557 J
env55K N
,55N O
ILoggerFactory55P ^
loggerFactory55_ l
)55l m
{66 	
if77 
(77 
env77 
.77 
IsDevelopment77 !
(77! "
)77" #
)77# $
{88 
app:: 
.:: 

UseSwagger:: 
(:: 
)::  
;::  !
app;; 
.;; 
UseSwaggerUI;;  
(;;  !
c<< 
=><< 
c<< 
.<< 
SwaggerEndpoint<< *
(<<* +
$str<<+ E
,<<E F
$str<<G ]
)<<] ^
)== 
;== 
}>> 
loggerFactory@@ 
.@@ 

AddLog4Net@@ $
(@@$ %
)@@% &
;@@& '
appBB 
.BB 
UseMiddlewareBB 
<BB 
ExceptionMiddlewareBB 1
>BB1 2
(BB2 3
)BB3 4
;BB4 5
appDD 
.DD 
UseHttpsRedirectionDD #
(DD# $
)DD$ %
;DD% &
appFF 
.FF 

UseRoutingFF 
(FF 
)FF 
;FF 
appHH 
.HH 
UseCorsHH 
(HH 
xHH 
=>HH 
xHH 
.HH 
AllowAnyHeaderHH -
(HH- .
)HH. /
.II 
AllowAnyMethodII 
(II 
)II  
.JJ 
WithOriginsJJ 
(JJ 
$strJJ 4
)JJ4 5
)JJ5 6
;JJ6 7
appLL 
.LL 
UseAuthenticationLL !
(LL! "
)LL" #
;LL# $
appMM 
.MM 
UseAuthorizationMM  
(MM  !
)MM! "
;MM" #
appOO 
.OO 
UseEndpointsOO 
(OO 
	endpointsOO &
=>OO' )
{PP 
	endpointsQQ 
.QQ 
MapControllersQQ (
(QQ( )
)QQ) *
;QQ* +
}RR 
)RR 
;RR 
}SS 	
}TT 
}UU 