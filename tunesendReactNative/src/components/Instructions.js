import React, { Component } from 'react';
import { View, Text, Image, Switch } from 'react-native';
import Video from 'react-native-video';


const HEADER_MAX_HEIGHT = 200;


class Instructions extends Component {

	constructor() {
		super();

		this.state = {
			isToggled: false
		};
	}

	componentDidMount() {
	}

	render() {
			const {
				// ScrollViewContent,
				TextContainer,
				TextFormat,
				IconFormat,
				gifFormat,
				gifFormat1
			} = styles;


// Later to trigger fullscreen
// this.player.presentFullscreenPlayer()

			return (
				<View style={TextContainer}>
					<Video
						style={gifFormat1}
						source={{ uri: './settings.mp4' }}
						ref={(ref) => {
							console.log('this', this.player);
							this.player = ref;
						}}                            // Store reference
						rate={1.0}                    // 0 is paused, 1 is normal.
						paused={false}                // Pauses playback entirely.
						resizeMode="cover"            // Fill the whole screen at aspect ratio.*
						repeat={true}               // Repeat forever.
						playWhenInactive={false}    // [iOS] Video continues to play when control or notification center are shown. 
						onLoadStart={this.loadStart}  // Callback when video starts to load
						onLoad={this.setDuration}     // Callback when video loads
						onEnd={this.onEnd}            // Callback when playback finishes
						onError={this.videoError}     // Callback when video cannot be loaded
					/>
					<Text style={TextFormat}>
						Open Settings
						<Image style={IconFormat} source={require('../image/settingsIconIOS.png')} />
					</Text>
					<Video
						style={gifFormat}
						source={{ uri: './TuneSend.mp4' }}
						ref={(ref) => {
							console.log('this', this.player);
							this.player = ref;
						}}                            // Store reference
						rate={1.0}                    // 0 is paused, 1 is normal.
						paused={false}                // Pauses playback entirely.
						resizeMode="cover"            // Fill the whole screen at aspect ratio.*
						repeat={true}               // Repeat forever.
						playWhenInactive={false}    // [iOS] Video continues to play when control or notification center are shown. 
						onLoadStart={this.loadStart}  // Callback when video starts to load
						onLoad={this.setDuration}     // Callback when video loads
						onEnd={this.onEnd}            // Callback when playback finishes
						onError={this.videoError}     // Callback when video cannot be loaded
					/>
					<Text style={TextFormat}>
						Scroll down to TuneSend
						<Image style={IconFormat} source={require('../image/TuneSendIconBlack.png')} />
					</Text>
					<Video
						style={gifFormat}
						source={{ uri: './keyboards.mp4' }}
						ref={(ref) => {
							console.log('this', this.player);
							this.player = ref;
						}}                            // Store reference
						rate={1.0}                    // 0 is paused, 1 is normal.
						paused={false}                // Pauses playback entirely.
						resizeMode="cover"            // Fill the whole screen at aspect ratio.*
						repeat={true}               // Repeat forever.
						playWhenInactive={false}    // [iOS] Video continues to play when control or notification center are shown. 
						onLoadStart={this.loadStart}  // Callback when video starts to load
						onLoad={this.setDuration}     // Callback when video loads
						onEnd={this.onEnd}            // Callback when playback finishes
						onError={this.videoError}     // Callback when video cannot be loaded
					/>
					<Text style={TextFormat}>
						Click on keyboards
						<Image style={IconFormat} source={require('../image/keyboardsIconIOS.png')} />
					</Text>
					<Video
						style={gifFormat}
						source={{ uri: './switchOn.mp4' }}
						ref={(ref) => {
							console.log('this', this.player);
							this.player = ref;
						}}                            // Store reference
						rate={1.0}                    // 0 is paused, 1 is normal.
						paused={false}                // Pauses playback entirely.
						resizeMode="cover"            // Fill the whole screen at aspect ratio.*
						repeat={true}               // Repeat forever.
						playWhenInactive={false}    // [iOS] Video continues to play when control or notification center are shown. 
						onLoadStart={this.loadStart}  // Callback when video starts to load
						onLoad={this.setDuration}     // Callback when video loads
						onEnd={this.onEnd}            // Callback when playback finishes
						onError={this.videoError}     // Callback when video cannot be loaded
					/>
					<Text style={TextFormat}>
						<Switch
							value = {this.state.isToggled}
							onValueChange={ (newValue) => this.setState({ isToggled: newValue })}
						 />
					</Text>
				</View>
			);
	}


	// toggleOnOff() {
	// 	if (this.state.onToggle === false) {
	// 		this.setState({ onToggle: true });
	// 	} else {
	// 		this.setState({ onToggle: false });
	// 	}
	// }

}


const styles = {
	TextContainer: {
			flex: 1,
			alignItems: 'center',
			marginTop: HEADER_MAX_HEIGHT,
		},
		TextFormat: {
			marginTop: 10,
			fontSize: 24,
		},
		IconFormat: {
			marginTop: 12,
			marginLeft: 10,
			width: 40,
			height: 40,
		},
		gifFormat: {
			flexWrap: 'wrap',
			flexDirection: 'column',
			marginTop: 70,
			marginBottom: 4,
			borderWidth: 1,
			width: 120,
			height: 240,
		},
		gifFormat1: {
			flexWrap: 'wrap',
			flexDirection: 'column',
			marginTop: 30,
			marginBottom: 4,
			borderWidth: 1,
			width: 120,
			height: 240,
		}
};

export default Instructions;

