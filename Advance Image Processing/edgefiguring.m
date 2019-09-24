function varargout = edgefiguring(varargin)
% EDGEFIGURING MATLAB code for edgefiguring.fig
%      EDGEFIGURING, by itself, creates a new EDGEFIGURING or raises the existing
%      singleton*.
%
%      H = EDGEFIGURING returns the handle to a new EDGEFIGURING or the handle to
%      the existing singleton*.
%
%      EDGEFIGURING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDGEFIGURING.M with the given input arguments.
%
%      EDGEFIGURING('Property','Value',...) creates a new EDGEFIGURING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before edgefiguring_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to edgefiguring_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help edgefiguring

% Last Modified by GUIDE v2.5 23-Sep-2019 19:32:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @edgefiguring_OpeningFcn, ...
                   'gui_OutputFcn',  @edgefiguring_OutputFcn, ...
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


% --- Executes just before edgefiguring is made visible.
function edgefiguring_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to edgefiguring (see VARARGIN)

% Choose default command line output for edgefiguring
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes edgefiguring wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = edgefiguring_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global edge1
[FileName,FilePath]=uigetfile('*.*','SELECT IMAGE');
name=strcat(FilePath,FileName);
edge1=imread(name);
axes(handles.axes1)
imshow(edge1)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global edge1
edge2=imsharpen(edge1,'Radius',2,'Amount',2);
axes(handles.axes2);
imshow(edge2)

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
