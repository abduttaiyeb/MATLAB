function varargout = focus(varargin)
% FOCUS MATLAB code for focus.fig
%      FOCUS, by itself, creates a new FOCUS or raises the existing
%      singleton*.
%
%      H = FOCUS returns the handle to a new FOCUS or the handle to
%      the existing singleton*.
%
%      FOCUS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOCUS.M with the given input arguments.
%
%      FOCUS('Property','Value',...) creates a new FOCUS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before focus_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to focus_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help focus

% Last Modified by GUIDE v2.5 23-Sep-2019 19:24:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @focus_OpeningFcn, ...
                   'gui_OutputFcn',  @focus_OutputFcn, ...
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


% --- Executes just before focus is made visible.
function focus_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to focus (see VARARGIN)

% Choose default command line output for focus
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes focus wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = focus_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global foc1
[FileName,FilePath]=uigetfile('*.*','SELECT IMAGE');
name=strcat(FilePath,FileName);
foc1=imread(name);
axes(handles.axes1);
imshow(foc1);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global foc1
foc2=foc1+25;
axes(handles.axes2);
imshow(foc2)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
