import React, { Component } from 'react';
import { View, Text, Image } from 'react-native';

class Installation extends Component {
		constructor(props) {
			super(props);

		this.state = {
			isToggled: false,
			isToggled2: false,
			isReady: false
		};
	}

		render() {
			const {
				TextContainer,
				TextView,
				TextFormat,
				IconFormat,
				FullAccessText
			} = styles;

			return (

				<View
					style={TextContainer}
				>
						<View 
							style={{
								...TextView,
								borderBottomColor: 'rgba(0, 0, 0, 0.2)',
								borderBottomWidth: 2,
								marginBottom: 16,
								marginTop: 30
							}}
						>
								<Text style={{ 
									...TextFormat, 
									fontSize: 24, 
									marginTop: 0, 
									marginBottom: 6
								}}>
								Starting With
								</Text>
								<Text
									style={{
										...TextFormat,
										color: '#55b2f9',
										paddingLeft: 6,
										fontSize: 24,
										marginTop: 0,
										marginBottom: 6
									}}
								>
									Tune
								</Text>
								<Text
									style={{
										...TextFormat,
										color: '#f6be5f',
										fontSize: 24,
										paddingRight: 5,
										marginTop: 0,
										marginBottom: 6
									}}
								>
									Send
								</Text>
						</View>
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
								Key
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
								Key
							</Text>
							<Text
								style={{
									...TextFormat,
									color: '#f6be5f',
									paddingRight: 5
								}}
							>
								Board
							</Text>
							<Image 
								style={{ 
									...IconFormat,
									marginLeft: 5,
									marginTop: 9,
									resizeMode: 'contain',
                            		width: 45
								}}
								source={require('../image/toggleSwitch.png')} 
							/>
					</View>
					<View style={{ ...TextView, marginBottom: 0 }}>
							<Text style={{ ...TextFormat, marginBottom: 0 }}>
								Allow
							</Text>
							<Text
								style={{
									...TextFormat,
									color: '#55b2f9',
									paddingLeft: 6,
									paddingRight: 4,
									marginBottom: 0
								}}
							>
								Full
							</Text>
							<Text
								style={{
									...TextFormat,
									color: '#f6be5f',
									paddingLeft: 2,
									marginBottom: 0
								}}
							>
								Access
							</Text>
							<Image 
								style={{ 
									...IconFormat,
									marginLeft: 4,
									marginTop: 9,
									resizeMode: 'contain',
                            		width: 45
								}}
								source={require('../image/toggleSwitch.png')}
							/>
					</View>
					<View style={{ ...TextView, marginBottom: 12, marginTop: 5 }}>
						<Text style={FullAccessText}>
							The Allow Full Access switch will appear once the keyboard switch is enabled.{"\n"}{"\n"}
							If the Allow Full Access switch isn't on, you will not be able to create or copy and paste your recording when texting {"\n"}
						</Text>
					</View>
					<View style={TextView}>
						<Text
							style={{
								...TextFormat,
								fontSize: 20
							}}
						>
								Make Sure To Turn On Your Sound!!
						</Text>
					</View>
			</View>
			);
	}
}


const styles = {
	TextContainer: {
		backgroundColor: '#ffffff',
		flex: 1,
		alignItems: 'center',
		marginTop: 0,
		marginBottom: 0,
		justifyContent: 'center',
	},
	TextView: {
		flexDirection: 'row',
	},
	TextFormat: {
		marginTop: 10,
		fontSize: 20,
		marginBottom: 25,
		fontFamily: 'Pacifico',
	},
	FullAccessText: {
		marginTop: 5,
		fontSize: 13,
		fontFamily: 'Helvetica',
		paddingRight: 70,
		paddingLeft: 70, 
		textAlign: 'center'
	},
	IconFormat: {
		marginTop: 12,
		marginLeft: 10,
		width: 34,
		height: 34,
	}
};

export default Installation;
