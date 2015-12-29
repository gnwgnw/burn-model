function varargout = model(varargin)
% MODEL M-file for model.fig
%      MODEL, by itself, creates a new MODEL or raises the existing
%      singleton*.
%
%      H = MODEL returns the handle to a new MODEL or the handle to
%      the existing singleton*.
%
%      MODEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MODEL.M with the given input arguments.
%
%      MODEL('Property','Value',...) creates a new MODEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before model_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to model_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help model

% Last Modified by GUIDE v2.5 29-Dec-2015 16:29:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @model_OpeningFcn, ...
                   'gui_OutputFcn',  @model_OutputFcn, ...
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


% --- Executes just before model is made visible.
function model_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to model (see VARARGIN)
 handles.right = 0.01;
 handles.edittext_right.('String') = handles.right;
 handles.burn_edge = 1e-3;
 handles.edittext_burn_edge.('String') = handles.burn_edge;
 handles.right_plot = 1e-3; 
 handles.edittext_right_plot.('String') = handles.right_plot;
 handles.N = 2000;
 handles.edittext_N.('String') = handles.N;
 handles.Gt = -5e4;
 handles.edittext_Gt.('String') = handles.Gt;
 handles.Cpt = 1464;
 handles.edittext_Cpt.('String') = handles.Cpt;
 handles.Ts0 = 300;
 handles.edittext_Ts0.('String') = handles.Ts0;
 handles.lambda = 0.23;
 handles.edittext_lambda.('String') = handles.lambda;
 handles.R = 363;
 handles.edittext_R.('String') = handles.R;
 handles.Cp = 1800;
 handles.edittext_Cp.('String') = handles.Cp;
 handles.Ts = 720;
 handles.edittext_Ts.('String') = handles.Ts;
 handles.Tmax = 2360;
 handles.edittext_Tmax.('String') = handles.Tmax;
 handles.rho_t = 1600;
 handles.edittext_rho_t.('String') = handles.rho_t;
 handles.Ea = 4e6;
 handles.edittext_Ea.('String') = handles.Ea;
% Choose default command line output for model
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes model wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = model_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edittext_lambda_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_lambda.('String'));

% Hints: get(hObject,'String') returns contents of edittext_lambda as text
%        str2double(get(hObject,'String')) returns contents of edittext_lambda as a double





function edittext_R_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_R.('String'));

% Hints: get(hObject,'String') returns contents of edittext_R as text
%        str2double(get(hObject,'String')) returns contents of edittext_R as a double



function edittext_Cp_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_Cp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_Cp.('String'));

% Hints: get(hObject,'String') returns contents of edittext_Cp as text
%        str2double(get(hObject,'String')) returns contents of edittext_Cp as a double



function edittext_right_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_right.('String'));

% Hints: get(hObject,'String') returns contents of edittext_right as text
%        str2double(get(hObject,'String')) returns contents of edittext_right as a double



function edittext_Ts_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_Ts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_Ts.('String'));

% Hints: get(hObject,'String') returns contents of edittext_Ts as text
%        str2double(get(hObject,'String')) returns contents of edittext_Ts as a double



function edittext_Tmax_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_Tmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_Tmax.('String'));

% Hints: get(hObject,'String') returns contents of edittext_Tmax as text
%        str2double(get(hObject,'String')) returns contents of edittext_Tmax as a double



function edittext_rho_t_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_rho_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_rho_t.('String'));
% Hints: get(hObject,'String') returns contents of edittext_rho_t as text
%        str2double(get(hObject,'String')) returns contents of edittext_rho_t as a double


function edittext_Ak_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_Ak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = get(handles.edittext_Ak, 'String');
c = strsplit(a);
handles.Ak_list = str2double(c);
guidata(hObject, handles);


function edittext_Ea_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_Ea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_Ea.('String'));

% Hints: get(hObject,'String') returns contents of edittext_Ea as text
%        str2double(get(hObject,'String')) returns contents of edittext_Ea
%        as a double


function edittext_Gt_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_Gt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_Gt.('String'));

% Hints: get(hObject,'String') returns contents of edittext_Gt as text
%        str2double(get(hObject,'String')) returns contents of edittext_Gt as a double


function edittext_Cpt_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_Cpt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_Cpt.('String'));

% Hints: get(hObject,'String') returns contents of edittext_Cpt as text
%        str2double(get(hObject,'String')) returns contents of edittext_Cpt as a double


function edittext_Ts0_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_Ts0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_Ts0.('String'));

% Hints: get(hObject,'String') returns contents of edittext_Ts0 as text
%        str2double(get(hObject,'String')) returns contents of edittext_Ts0 as a double

% --- Executes on button press in pushbutton_plot.
function pushbutton_plot_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Pk=unique([linspace(10^5, 10^7, 20) linspace(10^7, 10^8, 10)]);
n = length(Pk);
A= handles.Ak_list;
m=length(A);
     hold on;
for i=1:1:m
    for j=1:1:n
        Pk(j);
        %u(j) = foo(....) 
        u(j) = A(i);
    end
          plot(Pk,u);   
          legendInfo{i} = ['A = ' num2str(A(i))];
end    
   legend(legendInfo);

function edittext_burn_edge_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_burn_edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_burn_edge.('String'));

% Hints: get(hObject,'String') returns contents of edittext_burn_edge as text
%        str2double(get(hObject,'String')) returns contents of edittext_burn_edge as a double



function edittext_right_plot_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_right_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_right_plot.('String'));


% Hints: get(hObject,'String') returns contents of edittext_right_plot as text
%        str2double(get(hObject,'String')) returns contents of
%        edittext_right_plot as a double



function edittext_N_Callback(hObject, eventdata, handles)
% hObject    handle to edittext_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2num(handles.edittext_N.('String'));

% Hints: get(hObject,'String') returns contents of edittext_N as text
%        str2double(get(hObject,'String')) returns contents of edittext_N as a double
