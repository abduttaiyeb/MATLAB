function varargout = brightness(varargin)
% BRIGHTNESS MATLAB code for brightness.fig
%      BRIGHTNESS, by itself, creates a new BRIGHTNESS or raises the existing
%      singleton*.
%
%      H = BRIGHTNESS returns the handle to a new BRIGHTNESS or the handle to
%      the existing singleton*.
%
%      BRIGHTNESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BRIGHTNESS.M with the given input arguments.
%
%      BRIGHTNESS('Property','Value',...) creates a new BRIGHTNESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before brightness_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to brightness_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help brightness

% Last Modified by GUIDE v2.5 23-Sep-2019 18:46:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @brightness_OpeningFcn, ...
                   'gui_OutputFcn',  @brightness_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before brightness is made visible.
function brightness_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to brightness (see VARARGIN)

% Choose default command line output for brightness
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes brightness wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = brightness_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global bright1
[FileName,FilePath]=uigetfile('*.*','SELECT IMAGE');
name=strcat(FilePath,FileName);
bright1=imread(name);
axes(handles.axes1);
imshow(bright1)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global bright1
bright2=bright1-50;
axes(handles.axes2)
imshow(bright2)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global bright1
bright3=bright1+50;
axes(handles.axes3)
imshow(bright3)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
