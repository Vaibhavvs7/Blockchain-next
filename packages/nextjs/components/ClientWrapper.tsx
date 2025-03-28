"use client";

// Mark this as a client component
import { ReactNode } from "react";
import { AnonAadhaarProvider } from "@anon-aadhaar/react";

export const ClientWrapper = ({ children }: { children: ReactNode }) => {
  return <AnonAadhaarProvider>{children}</AnonAadhaarProvider>;
};
