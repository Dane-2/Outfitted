//
//  AuthFlowView.swift
//  Outfitted
//
//  Created on 1/6/26.
//

import SwiftUI

struct AuthFlowView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var vm = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()
                
                // App branding
                VStack(spacing: 8) {
                    Image(systemName: "tshirt.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.blue)
                    
                    Text("Outfitted")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Your personal style assistant")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                // Auth form
                VStack(spacing: 20) {
                    // Mode selector
                    Picker("Auth Mode", selection: $vm.mode) {
                        Text("Sign In").tag(AuthViewModel.AuthMode.signIn)
                        Text("Create Account").tag(AuthViewModel.AuthMode.signUp)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 32)
                    
                    // Email field
                    TextField("Email", text: $vm.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 32)
                    
                    // Password field
                    SecureField("Password", text: $vm.password)
                        .textContentType(vm.mode == .signUp ? .newPassword : .password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 32)
                    
                    // Submit button
                    Button(action: {
                        Task {
                            await vm.submit(appState: appState)
                        }
                    }) {
                        if vm.isLoading {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .tint(.white)
                        } else {
                            Text(vm.mode == .signIn ? "Sign In" : "Create Account")
                                .font(.headline)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .disabled(vm.isLoading)
                    .padding(.horizontal, 32)
                }
                .padding(.bottom, 48)
                
                Spacer()
            }
            .navigationTitle("")
            .alert("Error", isPresented: .constant(vm.errorMessage != nil)) {
                Button("OK") {
                    vm.errorMessage = nil
                }
            } message: {
                if let errorMessage = vm.errorMessage {
                    Text(errorMessage)
                }
            }
        }
    }
}

#Preview {
    AuthFlowView()
        .environmentObject(AppState())
}

