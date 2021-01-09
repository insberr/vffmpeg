module vffmpeg

import os

// VideoFormat supported video formats
pub enum VideoFormat {
	mp4
	mov
	mkv
}

// AudioFormat supported audio formats
pub enum AudioFormat {
	mp3
	m4a
	wav
	ogg
}


// Video The video struct for a video
struct Video {
pub mut:
	in_path string
	out_path string
	out_name string
}

struct Audio {
pub mut:
	in_path string
	out_path string
	out_name string
}

// convert Convert the video
pub fn (video Video) convert(format_to VideoFormat) ?string {
	output, err := os.exec('ffmpeg -i "$video.in_path" "$video.out_path/${video.out_name}.$format_to"') or { return err }
	if err {
		return 'There was and error converting that video: $err'
	}
	println(output)
	return output
}

// convert_video_audio_tracks convert.. it says it in the name
pub fn (video Video) convert_video_audio_tracks(audio_format AudioFormat, tracks []int) {
	println('convert audio track format')
}
