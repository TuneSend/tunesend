import React, { Component } from 'react';
import ReactNative, { View, Text, Image, Switch, Font, TextInput } from 'react-native';
import Video from 'react-native-video';
import { KeyboardAwareScrollView } from 'react-native-keyboard-aware-scroll-view';
// import KeyboardSpacer from 'react-native-keyboard-spacer';

const VIDEO_HEIGHT = 320;
// const VIDEO_HEIGHT_SMALL = window.width /7;

class Instructions extends Component {
		constructor(props) {
			super(props);

		this.state = {
			isToggled: false,
			isReady: false
		};
	}

		componentWillMount() {
			(async() => {
				await Font.loadAsync({
					Pacifico: { uri: 'https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet' }
			});

				this.setState({ isReady: true });
			})();
		}


		render() {
			console.log('Scroll:', this);
			const {
				// ScrollViewContent,
				TextContainer,
				TextView,
				TextFormat,
				IconFormat,
				gifFormat,
				inputContainerStyle,
				inputStyle
			} = styles;

			return (

				<KeyboardAwareScrollView
					style={{ backgroundColor: '#ffffff' }}
					resetScrollToCoords={{ x: 0, y: 1050 }}
					contentContainerStyle={TextContainer}
					// scrollEnabled={false} // the view itself doesn't scroll up/down (only if all fields fit into the screen)
					keyboardShouldPersistTaps='always' // make keyboard not disappear when tapping outside of input
					enableAutoAutomaticScroll={false} // turn off auto scrolling to the field behaviour, which is unfortunately buggy when autocomplete suggestions disappear from the keyboard as displayed in the gif above
				>
						<Video
							style={{ ...gifFormat, marginTop: 70 }}
							source={{ uri: './settings.mp4' }}
							ref={(ref) => {
								console.log('this', this.player);
								this.player = ref;
							}}                            // Store reference
							rate={1.0}                    // 0 is paused, 1 is normal.
							paused={false}                // Pauses playback entirely.
							resizeMode="cover"            // Fill the whole screen at aspect ratio.*
							repeat={true}               // Repeat forever.
							onLoadStart={this.loadStart}  // Callback when video starts to load
							onLoad={this.setDuration}     // Callback when video loads
							onEnd={this.onEnd}            // Callback when playback finishes
							onError={this.videoError}     // Callback when video cannot be loaded
						/>
						<View style={TextView}>
							<Text style={TextFormat}>
							Open
							</Text>
							<Text
								style={{
									...TextFormat,
									color: '#55b2f9',
									paddingLeft: 6
								}}
							>
								Sett
							</Text>
							<Text
								style={{
									...TextFormat,
									color: '#f6be5f',
								}}
							>
								ings
							</Text>
							<Image style={IconFormat} source={require('../image/settingsIconIOS.png')} />
						</View>
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
					<View style={TextView}>
						<Text style={TextFormat} behavior="padding">
							Scroll down to
						</Text>
						<Text
							style={{
								...TextFormat,
								color: '#55b2f9',
								paddingLeft: 6
							}}
						>
							Tune
						</Text>
						<Text
							style={{
								...TextFormat,
								color: '#f6be5f',
								paddingRight: 5
							}}
						>
							Send
						</Text>
						<Image style={{ ...IconFormat, marginLeft: 8 }} source={require('../image/TuneSendIconBlack.png')} />
					</View>
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
						playWhenInactive={false}    // [iOS] Video continues to play when control or
						//notification center are shown.
						onLoadStart={this.loadStart}  // Callback when video starts to load
						onLoad={this.setDuration}     // Callback when video loads
						onEnd={this.onEnd}            // Callback when playback finishes
						onError={this.videoError}     // Callback when video cannot be loaded
					/>
					<View style={TextView}>
						<Text style={TextFormat}>
							Click on
							</Text>
							<Text
								style={{
									...TextFormat,
									color: '#55b2f9',
									paddingLeft: 6
								}}
							>
								key
							</Text>
							<Text
								style={{
									...TextFormat,
									color: '#f6be5f',
								}}
							>
								boards
							</Text>
						<Image style={{ ...IconFormat, marginLeft: 5 }} source={require('../image/keyboardsIconIOS.png')} />
					</View>
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
						playWhenInactive={false}    // [iOS] Video continues to play when control or
						//notification center are shown.
						onLoadStart={this.loadStart}  // Callback when video starts to load
						onLoad={this.setDuration}     // Callback when video loads
						onEnd={this.onEnd}            // Callback when playback finishes
						onError={this.videoError}     // Callback when video cannot be loaded
					/>
					<View style={TextView}>
							<Text style={TextFormat}>
								Enable
							</Text>
							<Text
								style={{
									...TextFormat,
									color: '#55b2f9',
									paddingLeft: 6
								}}
							>
								Tune
							</Text>
							<Text
								style={{
									...TextFormat,
									color: '#f6be5f',
									paddingRight: 5
								}}
							>
								Send
							</Text>
						<Switch
							style={{ ...IconFormat, marginTop: 18, marginLeft: 3 }}
							value={this.state.isToggled}
							onValueChange={(newValue) => this.setState({ isToggled: newValue })}
						/>
					</View>
					<View style={inputContainerStyle}>
						<TextInput
							// onFocus={this.scroll.props.scrollToPosition(0, 800)}
							style={inputStyle}
							placeholder={'Test TuneSend Keyboard Here!'}
						/>
					</View>
			</KeyboardAwareScrollView>
			);
	}
}


const styles = {
	TextContainer: {
			backgroundColor: '#ffffff',
			flex: 1,
			alignItems: 'center',
			marginTop: 0,
			justifyContent: 'center',
	},
	TextView: {
		flexDirection: 'row',
	},
	TextFormat: {
		marginTop: 10,
		fontSize: 24,
		marginBottom: 25,
		fontFamily: 'Pacifico',
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
		width: 240,
		height: VIDEO_HEIGHT,
	},
	inputContainerStyle: {
		borderRadius: 20,
		borderWidth: 1,
		borderColor: 'grey',
		width: 340,
		height: 40,
		marginBottom: 140
	},
	inputStyle: {
		height: 40,
		fontSize: 22,
		// color: '#55b2f9',
		paddingLeft: 10,
		// fontFamily: 'Pacifico',
	}
};

export default Instructions;
