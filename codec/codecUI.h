#include "CvLowDef.h"
	//��������к���ָ��
	COS_DWORD	__stdcall MP1L2_Dec_codec(COS_HANDLE codech,COS_BYTE* indata,COS_DWORD insize,COS_BYTE *outdata,COS_DWORD *outsize);
	//��ʼ����������к���ָ��
    COS_HANDLE	__stdcall MP1L2_Dec_initialize(unsigned long sample_rate,  unsigned long bit_rate,  unsigned long chn);
	//ж�ر�������к���ָ��
	COS_VOID	__stdcall MP1L2_Dec_uninitialize(COS_HANDLE codech);
	//ȡ�õ�ǰ�ı����״̬
	//COS_BOOL	MP1L2_Dec_state(COS_HANDLE codech,COS_DWORD *sample,COS_DWORD *bitrae,COS_DWORD *stereo);
//	int __stdcall AQ_FeatureExtraction(LPTSTR m_SourceFile,LPTSTR m_DecodedFile,long *parentwinhand);
	void PCMNormalize(float* frameA, const short* wavpcm,int len);
	void Stereo2Mono(short* WavBuf, int samplsize);
	COS_DWORD FeatureExtraction_PCMbuf(COS_HANDLE WavbufHeader, short *Wavbuf,int inbufsize, float *outbuffer, COS_DWORD *outsize);
	COS_DWORD __stdcall FeatureExtraction_initialize(unsigned long samplerate, int channels, int chn_process);
	COS_VOID __stdcall FeatureExtraction_uninitialize(COS_HANDLE Header);
