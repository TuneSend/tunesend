import React, { Component } from 'react';
import { View, Text, Image } from 'react-native';
import ToggleSwitch from 'toggle-switch-react-native'

const HEADER_MAX_HEIGHT = 200;


class Instructions extends Component {

	constructor() {
		super();

		this.state = {
			onToggle: false
		};
	}

	toggleOnOff() {
		if(this.state.onToggle === false) {
			this.setState({ onToggle: true })
		} else {
			this.setState({ onToggle: false })
		}
	}


	render() {
			const {
				// ScrollViewContent,
				TextContainer,
				TextFormat,
				IconFormat
			} = styles;

			return (
				<View style={TextContainer}>
					{/*<Image style={ImageSize} source={require('../image/test/number1.jpg')} />*/}
					<Text style={TextFormat}>
						Open Settings
						<Image style={IconFormat} source={require('../image/settingsIconIOS.png')} />
					</Text>
					{/*<Image style={ImageSize} source={require('../image/test/number2.jpg')} />*/}
					<Text style={TextFormat}>
						Scroll down to TuneSend
						<Image style={IconFormat} source={require('../image/TuneSendIconBlack.png')} />
					</Text>
					{/*<Image style={ImageSize} source={require('../image/test/number3.jpg')} />*/}
					<Text style={TextFormat}>
						Click on keyboards
						<Image style={IconFormat} source={require('../image/keyboardsIconIOS.png')} />
					</Text>
					<Text style={TextFormat}>
						Toggle switch on
						{/*<ToggleSwitch
							style={IconFormat}
							isOn={false}
							onColor='green'
							offColor='grey'
							size='medium'
							onToggle={ (isOn) => console.log('changed to : ', isOn) }
							onToggle={ this.setState({ onToggle: toggleOnOff() }, () => console.log('changed to : ', isOn) }
						/>*/}
					</Text>
				</View>
				);
	}
}


const styles = {
	TextContainer: {
			flex: 1,
			alignItems: 'center',
			marginTop: HEADER_MAX_HEIGHT,
		},
		TextFormat: {
			marginTop: 30,
			fontSize: 24,
		},
		IconFormat: {
			marginTop: 12,
			marginLeft: 10,
			width: 40,
			height: 40,
		},
};

export default Instructions;

