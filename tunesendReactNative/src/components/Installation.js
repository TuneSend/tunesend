import React, { Component } from 'react';
import { View, Text, Image, StyleSheet } from 'react-native';
import styles from '../stylesheets/styles';

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
				TextFormatWithMargin,
				IconFormatInstallation,
				FullAccessTextInstallation
			} = styles;

			return (

				<View
					style={TextContainer}
				>
						<View 
							style={StyleSheet.flatten([
								TextView,
								{
									borderBottomColor: 'rgba(0, 0, 0, 0.2)',
									borderBottomWidth: 2,
									marginBottom: 16,
									marginTop: 30
								}
							])}
						>
								<Text style={StyleSheet.flatten([
									TextFormatWithMargin,
									{
										fontSize: 24,
										marginTop: 0,
										marginBottom: 6
									}
								])}
								>
								Starting With
								</Text>
								<Text
									style={StyleSheet.flatten([
										TextFormatWithMargin,
										{
											color: '#55b2f9',
											paddingLeft: 6,
											fontSize: 24,
											marginTop: 0,
											marginBottom: 6
										}
									])}
								>
									Tune
								</Text>
								<Text
									style={StyleSheet.flatten([
										TextFormatWithMargin,
										{
											color: '#f6be5f',
											fontSize: 24,
											paddingRight: 5,
											marginTop: 0,
											marginBottom: 6
										}
									])}
								>
									Send
								</Text>
						</View>
						<View style={TextView}>
							<Text style={TextFormatWithMargin}>
							Open
							</Text>
							<Text
								style={StyleSheet.flatten([
									TextFormatWithMargin,
									{
										color: '#55b2f9',
										paddingLeft: 6
									}
								])}
							>
								Sett
							</Text>
							<Text
								style={StyleSheet.flatten([
									TextFormatWithMargin,
									{color: '#f6be5f'}
								])}
							>
								ings
							</Text>
							<Image style={IconFormatInstallation} source={require('../image/settingsIconIOS.png')} />
						</View>
					<View style={TextView}>
						<Text style={TextFormatWithMargin} behavior="padding">
							Scroll down to
						</Text>
						<Text
							style={StyleSheet.flatten([
								TextFormatWithMargin,
								{
									color: '#55b2f9',
									paddingLeft: 6
								}
							])}
						>
							Tune
						</Text>
						<Text
							style={StyleSheet.flatten([
								TextFormatWithMargin,
								{
									color: '#f6be5f',
									paddingRight: 5
								}
							])}
						>
							Send
						</Text>
						<Image
							style={StyleSheet.flatten([
								IconFormatInstallation,
								{
									marginLeft: 8
								}
							])}
							source={require('../image/TuneSendIconBlack.png')} />
					</View>
					<View style={TextView}>
						<Text style={TextFormatWithMargin}>
							Click on
							</Text>
							<Text
								style={StyleSheet.flatten([
									TextFormatWithMargin,
									{
										color: '#55b2f9',
										paddingLeft: 6
									}
								])}
							>
								Key
							</Text>
							<Text
								style={StyleSheet.flatten([
									TextFormatWithMargin,
									{color: '#f6be5f'}
								])}
							>
								boards
							</Text>
						<Image style={StyleSheet.flatten([
							IconFormatInstallation,
							{marginLeft: 5}
						])}
							source={require('../image/keyboardsIconIOS.png')}
						/>
					</View>
					<View style={TextView}>
							<Text style={TextFormatWithMargin}>
								Enable
							</Text>
							<Text
								style={StyleSheet.flatten([
									TextFormatWithMargin,
									{
										color: '#55b2f9',
										paddingLeft: 6
									}
								])}
							>
								Key
							</Text>
							<Text
								style={StyleSheet.flatten([
									TextFormatWithMargin,
									{
										color: '#f6be5f',
										paddingRight: 5
									}
								])}
							>
								Board
							</Text>
							<Image 
								style={StyleSheet.flatten([
									IconFormatInstallation,
									{
										marginLeft: 5,
										marginTop: 9,
										resizeMode: 'contain',
										width: 45
									}
								])}
								source={require('../image/toggleSwitch.png')} 
							/>
					</View>
					<View style={StyleSheet.flatten([
						TextView,
						{
							marginBottom: 0
						}
						])}>
							<Text style={StyleSheet.flatten([
								TextFormatWithMargin,
								{
									marginBottom: 0
								}
							])}
							>
								Allow
							</Text>
							<Text
								style={StyleSheet.flatten([
									TextFormatWithMargin,
									{
										color: '#55b2f9',
										paddingLeft: 6,
										paddingRight: 4,
										marginBottom: 0
									}
								])}
							>
								Full
							</Text>
							<Text
								style={StyleSheet.flatten([
									TextFormatWithMargin,
									{
										color: '#f6be5f',
										paddingLeft: 2,
										marginBottom: 0
									}
								])}
							>
								Access
							</Text>
							<Image 
								style={StyleSheet.flatten([
									IconFormatInstallation,
									{
										marginLeft: 4,
										marginTop: 9,
										resizeMode: 'contain',
										width: 45
									}
								])}
								source={require('../image/toggleSwitch.png')}
							/>
					</View>
					<View 
						style={StyleSheet.flatten([
							TextView,
							{
								marginBottom: 12,
								marginTop: 5
							}
						])}
					>
						<Text style={FullAccessTextInstallation}>
							The Allow Full Access switch will appear once the keyboard switch is enabled.{"\n"}{"\n"}
							If the Allow Full Access switch isn't on, you will not be able to create or copy and paste your recording when texting {"\n"}
						</Text>
					</View>
					<View style={TextView}>
						<Text
							style={StyleSheet.flatten([
								TextFormatWithMargin,
								{
									fontSize: 20
								}
							])}
						>
								Make Sure To Turn On Your Sound!!
						</Text>
					</View>
			</View>
			);
	}
}

export default Installation;
